配置终端terminal 显示 git log 彩色

```bash
git config --global alias.lg "log --pretty=format:'%Cred%h%Creset - %Cblue%ad%Creset(%C(cyan)%ar%Creset) %Cgreen%an%Creset : %C(yellow)%d%Creset %s' --graph --abbrev-commit"
```

