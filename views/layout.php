<?php // views/layout.php ?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mini MVC — Gestion Étudiants</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
  <style>
    .container{max-width: 980px; margin: 2rem auto;}
    .pagination a{margin: 0 .25rem;}
    .error{color: #b00020;}
    table{width:100%;}
  </style>
</head>
<body>
  <main class="container">
    <nav>
      <ul>
        <li>Gestion Étudiants</li>
      </ul>
      <ul>
        <li><a href="/etudiants">Liste</a></li>
        <li><a href="/etudiants/create">Ajouter</a></li>
      </ul>
    </nav>
    <section>
      <?php echo $content; ?>
    </section>
  </main>
</body>
</html>