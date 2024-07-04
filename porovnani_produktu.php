
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Porovnání produktů</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Porovnání produktů</h1>
        <div class="bg-white p-4 rounded-lg shadow mb-4">
            <h2 class="text-xl font-semibold mb-2">Produkt 1 vs Produkt 2</h2>
            <table class="table-auto w-full">
                <thead>
                    <tr>
                        <th class="px-4 py-2">Parametr</th>
                        <th class="px-4 py-2">Produkt 1</th>
                        <th class="px-4 py-2">Produkt 2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="border px-4 py-2">Rychlost</td>
                        <td class="border px-4 py-2">25 km/h</td>
                        <td class="border px-4 py-2">30 km/h</td>
                    </tr>
                    <tr>
                        <td class="border px-4 py-2">Dojezd</td>
                        <td class="border px-4 py-2">50 km</td>
                        <td class="border px-4 py-2">45 km</td>
                    </tr>
                    <!-- Přidejte další parametry podle potřeby -->
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
