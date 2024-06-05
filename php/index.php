<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        td {
            border: 1px solid black;
            padding: 2px 20px;
            text-align: center;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
    </style>
</head>
<body>
    
    <?php
        $sql = "SELECT tanulonev, tanuloszulido FROM tanulok WHERE tanulovaros = 'Eger' ORDER BY tanuloszulido";
        $kapcs = new mysqli("localhost","root","","iskola");
        if ($kapcs -> connect_errno)
        {
            die("Hiba történt: " . $kapcs -> connect_error);
        }
        else
        {
            echo "Az adatbáziskapcsolat rendben létrejött.";
        }

        $eredmeny = $kapcs -> query($sql);

        echo "<p>Az egri tanulók száma: " . $eredmeny -> num_rows . "</p>";

        echo "<table>";
        while ($sor = $eredmeny -> fetch_assoc())
        {
            echo "<tr>";
            echo "<td>$sor[tanulonev]</td>";
            echo "<td>$sor[tanuloszulido]</td>";
            echo "</tr>";
        }
        echo "</table>";

        $kapcs -> close();
    ?>


</body>
</html>