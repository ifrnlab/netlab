# Gráficos do Git

```mermaid

gitGraph:
options
{
    "nodeSpacing": 150,
    "nodeRadius": 10
}
end

commit
branch novoRamo
checkout novoRamo
commit
commit
checkout master
commit
commit
merge novoRamo
```

```mermaid
gitGraph:
options
{
    "nodeSpacing": 150,
    "nodeRadius": 10
}
end
commit
branch newbranch
checkout newbranch
commit
commit
checkout master
commit
commit
merge newbranch
```