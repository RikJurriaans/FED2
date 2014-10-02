<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="Web App V1, basic JavaScript Skeleton">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Favorite Movies</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"></link>
</head>
<body>
<main id="content">

    <header>
        <nav>
            <ul>
                <li><a href="#about">About</a></li>
                <li><a href="#movies">Movies</a></li>
            </ul>
        </nav>
    </header>


    <!-- Het loaden ging niet... 
         Nader te onderzoeken. -->
    <?php include('templates/about.html'); ?>
    <?php include('templates/movies.html'); ?>

</main>

<script src="js/all.min.js"></script>

</body>
</html>
