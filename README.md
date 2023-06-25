# Sport Application

Cette application SwiftUI utilise le pattern MVVM pour afficher une liste de ligues de sports. Pour chaque ligue sélectionnée, l'application affiche une liste des équipes de cette ligue. Lorsqu'une équipe est sélectionnée, l'application affiche des détails sur cette équipe.

## Fonctionnalités

- Liste des ligues : Affiche une liste de ligues de sports récupérées à partir d'une API.
- Liste des équipes : Affiche une liste des équipes pour la ligue sélectionnée.
- Détail de l'équipe : Affiche des détails sur l'équipe sélectionnée, y compris son nom, sa bannière, son pays d'origine et sa description.

## Technologies utilisées

- SwiftUI: Utilisé pour construire l'interface utilisateur de l'application.
- MVVM: Le pattern Model-View-ViewModel est utilisé pour structurer le code de l'application.
- Async/Await: Les appels API sont effectués en utilisant la nouvelle fonctionnalité Async/Await de Swift 5.5, ce qui rend le code plus lisible et facile à comprendre.
