# Diagramas de sequência

```mermaid
sequenceDiagram
autonumber

Alice ->> João: Olá João, como está você?

loop VerificaçãoDeSaúde
    João ->> João: Luta contra a hipocondria.
end

João -->> Alice: Ótimo!
João ->> Bob: Como está você?
Bob -->> João: Estou muito bem, obrigado!
```