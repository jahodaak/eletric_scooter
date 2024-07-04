<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include_once 'common.php';

// Načíst inzeráty
$ads = [];
$stmt = $conn->prepare("SELECT ads.*, manufacturers.name AS manufacturer, models.model_name AS model, ad_images.image_path 
                        FROM ads 
                        JOIN manufacturers ON ads.manufacturer_id = manufacturers.id 
                        JOIN models ON ads.model_id = models.id
                        LEFT JOIN ad_images ON ads.id = ad_images.ad_id
                        ORDER BY ads.id DESC LIMIT 8");
$stmt->execute();
$result = $stmt->get_result();
while ($ad = $result->fetch_assoc()) {
    $ads[] = $ad;
}
$stmt->close();

// Načíst top 5 témat fóra
$topics = [];
$stmt = $conn->prepare("SELECT topics.*, users.nickname FROM topics 
                        JOIN users ON topics.user_id = users.id 
                        ORDER BY comment_count DESC LIMIT 5");
$stmt->execute();
$result = $stmt->get_result();
while ($topic = $result->fetch_assoc()) {
    $topics[] = $topic;
}
$stmt->close();

// Načíst top 5 chatovacích místností podle počtu uživatelů
$chat_rooms = [];
$stmt = $conn->prepare("SELECT chat_rooms.*, users.nickname FROM chat_rooms 
                        JOIN users ON chat_rooms.created_by = users.id 
                        ORDER BY (SELECT COUNT(*) FROM messages WHERE messages.room_id = chat_rooms.id) DESC LIMIT 5");
$stmt->execute();
$result = $stmt->get_result();
while ($chat_room = $result->fetch_assoc()) {
    $chat_rooms[] = $chat_room;
}
$stmt->close();
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hlavní stránka</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .grid-controls {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;
        }
        .grid-controls select {
            padding: 5px;
            font-size: 14px;
        }
        .ad-grid, .topic-grid, .chat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
        }
        .ad, .topic, .chat-room {
            border: 2px solid #aaa;
            padding: 10px;
            background-color: rgba(245, 245, 245, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .ad img, .topic img, .chat-room img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }
        .ad:hover, .topic:hover, .chat-room:hover {
            transform: scale(1.05);
        }
        h2 {
            text-align: center;
            background-color: #bbb;
            padding: 10px;
            border-radius: 8px;
        }
        .header-container {
            background-color: #bbb;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <?php renderHeader(); ?>
    </div>
    <div class="container">
        <h2>Nejpopulárnější konverzace</h2>
        <div class="topic-grid">
            <?php foreach ($topics as $topic): ?>
                <div class="topic">
                    <a href="topic.php?id=<?php echo htmlspecialchars($topic['id']); ?>">
                        <h3><?php echo htmlspecialchars($topic['title']); ?></h3>
                        <p>Autor: <?php echo htmlspecialchars($topic['nickname']); ?></p>
                        <?php if ($topic['image']): ?>
                            <img src="<?php echo htmlspecialchars($topic['image']); ?>" alt="Obrázek tématu">
                        <?php endif; ?>
                    </a>
                </div>
            <?php endforeach; ?>
        </div>

        <h2>Nejpopulárnější chatovací místnosti</h2>
        <div class="chat-grid">
            <?php foreach ($chat_rooms as $chat_room): ?>
                <div class="chat-room">
                    <a href="chat_room.php?id=<?php echo htmlspecialchars($chat_room['id']); ?>">
                        <h3><?php echo htmlspecialchars($chat_room['name']); ?></h3>
                        <p>Autor: <?php echo htmlspecialchars($chat_room['nickname']); ?></p>
                        <?php if ($chat_room['image']): ?>
                            <img src="<?php echo htmlspecialchars($chat_room['image']); ?>" alt="Obrázek místnosti">
                        <?php endif; ?>
                    </a>
                </div>
            <?php endforeach; ?>
        </div>

        <h2>Nejnovejší Inzeráty</h2>
        <div class="grid-controls">
            <label for="grid-size">Velikost inzerátů:</label>
            <select id="grid-size" onchange="updateGridSize()">
                <option value="small">Malé</option>
                <option value="medium" selected>Střední</option>
                <option value="large">Velké</option>
            </select>
        </div>
        <div id="ad-grid" class="ad-grid">
            <?php if (empty($ads)): ?>
                <p>Žádné inzeráty.</p>
            <?php else: ?>
                <?php foreach ($ads as $ad): ?>
                    <div class="ad">
                        <a href="ad.php?id=<?php echo htmlspecialchars($ad['id']); ?>">
                            <h3><?php echo htmlspecialchars($ad['name']); ?> (<?php echo htmlspecialchars($ad['manufacturer']); ?> - <?php echo htmlspecialchars($ad['model']); ?>)</h3>
                            <p>Cena: <?php echo htmlspecialchars($ad['price']); ?> Kč</p>
                            <?php if ($ad['image_path']): ?>
                                <img src="<?php echo htmlspecialchars($ad['image_path']); ?>" alt="Foto koloběžky">
                            <?php endif; ?>
                        </a>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
    <script>
        function updateGridSize() {
            const gridSize = document.getElementById('grid-size').value;
            const adGrid = document.getElementById('ad-grid');
            if (gridSize === 'small') {
                adGrid.style.gridTemplateColumns = 'repeat(auto-fill, minmax(100px, 1fr))';
            } else if (gridSize === 'medium') {
                adGrid.style.gridTemplateColumns = 'repeat(auto-fill, minmax(220px, 1fr))';
            } else if (gridSize === 'large') {
                adGrid.style.gridTemplateColumns = 'repeat(auto-fill, minmax(300px, 1fr))';
            }
        }
    </script>
</body>
</html>
