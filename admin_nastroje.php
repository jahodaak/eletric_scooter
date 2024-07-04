<?php
session_start();
if (!isset($_SESSION['admin']) || !$_SESSION['admin']) {
    header('Location: login.php');
    exit();
}
include_once 'common.php';

// Administrative functionalities
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Handle various administrative functions
}
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrátorské Nástroje</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Administrátorské Nástroje</h1>
        <div class="bg-white p-4 rounded-lg shadow mb-4">
            <h2 class="text-xl font-semibold mb-4">Správa Užívateľov</h2>
            <form action="admin_nastroje.php" method="post">
                <!-- Formulář pro správu uživatelů -->
            </form>
        </div>
        <div class="bg-white p-4 rounded-lg shadow mb-4">
            <h2 class="text-xl font-semibold mb-4">Správa Inzerátů</h2>
            <form action="admin_nastroje.php" method="post">
                <!-- Formulář pro správu inzerátů -->
            </form>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
            <h2 class="text-xl font-semibold mb-4">Správa Chatovacích Místností</h2>
            <form action="admin_nastroje.php" method="post">
                <!-- Formulář pro správu chatovacích místností -->
            </form>
        </div>
    </div>
</body>
</html>
