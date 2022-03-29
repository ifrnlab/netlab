# Diagrama de estados

```mermaid
stateDiagram-v2
[*] --> Parado
Parado --> [*]
Parado --> Movendo
Movendo --> Parado
Movendo --> Batido
Batido --> [*]
```