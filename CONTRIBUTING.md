# Guide de Contribution à PurgeX

## Style de Code

### Conventions Dart

1. **Nommage** :
   - Classes : `PascalCase` (ex: `CacheService`)
   - Fichiers : `snake_case` (ex: `cache_service.dart`)
   - Variables : `camelCase` (ex: `totalSize`)
   - Constantes : `camelCase` (ex: `maxRetries`)

2. **Commentaires** :
   ```dart
   /// Documentation Dart (pour les exports)
   /// Explique le rôle public
   /// 
   /// Exemple:
   /// ```dart
   /// final result = service.method();
   /// ```
   Class MyClass { ... }
   
   // Commentaire inline
   // Explique les détails d'implémentation
   ```

3. **Formatage** :
   ```bash
   dart format lib/
   ```

4. **Analyse** :
   ```bash
   dart analyze
   ```

### Structure de Fichier

```dart
// 1. Imports directs
import 'package:flutter/material.dart';

// 2. Imports relatifs
import 'package:purgex/models/cache_info.dart';

// 3. Part imports (si applicable)
part 'widget_part.dart';

// 4. Code du fichier
class MyClass { ... }
```

## Workflow Git

### Branches

- `main` : Production stable
- `develop` : Intégration des features
- `feature/description` : Nouvelles fonctionnalités
- `bugfix/description` : Corrections de bugs
- `docs/description` : Améliorations docs

### Commit Messages

```
type(scope): subject

body

footer
```

**Types** :
- `feat` : Nouvelle fonctionnalité
- `fix` : Correction de bug
- `docs` : Documentation
- `refactor` : Refactoring sans changement fonctionnel
- `perf` : Optimisation performance
- `test` : Ajout/modification de tests
- `chore` : Maintenance, dépendances, etc.

**Exemple** :
```
feat(cache): add cache comparison by date

Implement new sorting option to order caches by
last modification date in addition to size.

Closes #42
```

## Pull Request

### Checklist avant PR

- [ ] Code formaté (`dart format`)
- [ ] Pas d'erreurs d'analyse (`dart analyze`)
- [ ] Tests ajoutés/mis à jour
- [ ] Documentation mise à jour
- [ ] Commits atomiques et bien messagés
- [ ] Branch à jour avec `develop`

### Template PR

```markdown
## Description
Courte description de vos changements.

## Type de changement
- [ ] Bug fix
- [ ] Nouvelle fonctionnalité
- [ ] Breaking change
- [ ] Mise à jour de documentation

## Tests
Décrivez comment vous avez testé vos changements.

## Screenshots (si applicable)

## Checklist
- [ ] J'ai suivi le style de code du projet
- [ ] J'ai mis à jour la documentation appropriée
- [ ] Mes changements ne génèrent aucun warning
- [ ] J'ai ajouté des tests pour mes changements
```

## Rapport de Bug

### Template Issue

```markdown
## Description
Décrire clairement le bug.

## Étapes de reproduction
1. ...
2. ...
3. ...

## Comportement attendu

## Comportement réel

## Environnement
- Android version: 
- Flutter version: `flutter --version`
- Device: 

## Logs/Screenshots
```

## Requests de Feature

### Template

```markdown
## Description
Décrire la nouvelle fonctionnalité souhaitée.

## Bénéfices
- Avantage 1
- Avantage 2

## Design/Spécification (optionnel)
Décrire comment vous l'implémenteriez.
```

## Ressources

- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Best Practices](https://flutter.dev/docs/testing)
- [Git Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows)

## Support

Pour des questions, ouvrez une Discussion ou un Issue sur GitHub.
