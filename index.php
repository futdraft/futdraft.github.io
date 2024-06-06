<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FutDraft</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<style>
    .center {
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
    }

    .centerdiv {
        width: 500px;
        height: 200px;
        position: relative;
        top: 40%;
        left: 10%;
        text-align: center;
        vertical-align: middle;
        background-color: rgba(0, 0, 0, 0.8);
    }

    @media only screen and (max-width: 600px) {
        .centerdiv {
            position: relative;
            margin: auto;
            top: 40;
            left: 0;
            width: 400px;
        }
    }
    table
    {
        margin: auto;
        width: 100%;
        margin-left: 5%;
        margin-right: 5%;
        font-size: 1.2em;
        width: 90%;
        text-align: center;
        margin-top: 50px;
    }

    table tr:nth-child(even) {
        background-color: rgba(0, 0, 0, 0.1);
    }

    table tr:nth-child(odd) {
        background-color: rgba(100, 100, 100, 0)
    }

    table tr:first-child {
    background-color: #DB8C15;
    font-weight: bolder;
    box-shadow: 0 0 20px gold;
    }

    table tr:nth-child(2) {
        background-color: #ABABAB;
        font-weight: bolder;
    }
    table tr:nth-child(3) {
        background-color: #B1560F;
        font-weight: bolder;
    }
    p
    {
        font-size: 1.2em;
    }
</style>

<body>
    <nav class="navbar navbar-expand-lg sticky-top" style="background-color: black; color: white;">
        <div class="container-fluid" style="width: 200px; margin: auto;">
            <a class="navbar-brand" href="#" style=" color: white;">
                <img src="images/icon.png" style="height: 20px;">FutDraft
            </a>
        </div>
    </nav>
    <div
        style="background-image: url(images/websitebackground.jpg); background-repeat: no-repeat; width: 100%; height: 1080px; background-position-x: 100%; margin-bottom: 0;padding-bottom: 0;">
        <div class=" text-white centerdiv">
            <h2 class="center" style="top: 35%;">Ugorj bele csapatépítés világába!</h2>
            <a class="btn btn-success center" href="https://github.com/futdraft/futdraft.github.io/releases/download/alphag/FutDraft.exe" style="top: 65%; width: fit-content;">Letöltés</a>
        </div>
    </div>
    <div style="background-image: url(images/background.jpg);">
        <div class="container-md bg-dark text-white" style="height: 1000px;">
            <div class="container" style="padding-top: 100px;">
                <H2>Bemutató a játékhoz</H2>
                <p>
                A FutDraft egy izgalmas játék, amely lehetővé teszi, hogy egy álomcsapatot építs össze korlátozott lehetőségek mellett.
Először válaszd ki a csapatod formációját. Fontos tudni, hogy miután kiválasztottad, nem változtathatod meg.
A következő lépésben válaszd ki a játékosokat. A játékosokat véletlenszerűen kapod, és a legmagasabb értéket képviselő játékosok közül választhatsz.
A kiválasztott játékosokból építsd fel a csapatodat. Figyelj a kémiai kapcsolatokra, mert ezek határozzák meg a csapat teljesítményét.

                </p>

                <br>

                <div style="justify-content: center;">
                <h2><span><img src="images/10-awards.png" alt="" style="height: 50px;"></span> Legjobb draftok: </h2>
                    <table class="">
                    <?php
                        $sql = "SELECT * FROM leaderboard ORDER BY Score DESC LIMIT 10";
                        $kapcs = new mysqli("localhost","root","","futdraft");
                        if ($kapcs -> connect_errno)
                        {
                            die("Hiba történt: " . $kapcs -> connect_error);
                        }
                        else
                        {
                            
                        }

                        $eredmeny = $kapcs -> query($sql);
                        $i = 0;

                        while ($sor = $eredmeny -> fetch_assoc())
                        {
                            $i += 1;
                            echo "<tr>";
                            echo "<td>$i.</td>";
                            echo "<td>$sor[Name]</td>";
                            echo "<td>$sor[Score]</td>";
                            echo "</tr>";
                        }

                        $kapcs -> close();
                    ?>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>