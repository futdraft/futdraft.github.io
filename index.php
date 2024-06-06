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
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        color: red;
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
            <a class="btn btn-success center" href="#download" style="top: 65%; width: fit-content;">Irány a
                letöltésekhez!</a>
        </div>
    </div>
    <div style="background-image: url(images/background.jpg);">
        <div class="container-md bg-dark text-white" style="height: 1000px;">
            <div class="container" style="padding-top: 100px;">
                <H2>Bemutató a játékhoz</H2>
                <p>
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quos beatae ad nam aliquid officia facere
                    ipsum in illum, nemo doloribus sequi atque vero, eveniet dicta? Voluptatem quos numquam voluptates
                    eum.
                </p>

                <br>

                <div style="justify-content: center;">
                <h2>Legjobb draftok:</h2>
                    <table class="center">
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

                <br>

                <p id="download" style="height: 100px; color: black; visibility: hidden;">a</p>
                <h2>Letöltés:</h2>
                <p>Még nem érhető el</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>