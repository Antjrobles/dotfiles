# Dotfiles por host

Cada carpeta contiene los dotfiles de una máquina de la red.

| Host | IP | Rol |
|------|-----|-----|
| raspy4 | 192.168.0.42:1984 | RPi |
| raspy4b | 192.168.0.52 | RPi |
| raspy4c | 192.168.0.61 | RPi |
| raspy4d | 192.168.0.26 | RPi |
| raspy4e | 192.168.0.54 | RPi (OpenClaw) |
| raspy4f | 192.168.0.58 | RPi |
| raspy5 | 192.168.0.32 | RPi |
| hetzner | 46.225.63.22 | VPS |

## Restaurar dotfiles en una máquina
```bash
# Ejemplo: restaurar raspy4f
scp hosts/raspy4f/.bashrc raspy4f:~/.bashrc
scp hosts/raspy4f/.zshrc raspy4f:~/.zshrc
```
