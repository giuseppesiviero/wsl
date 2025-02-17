# Installazione di WSL 2 con Ubuntu su Windows

## Prerequisiti
- Windows 10 (versione 1903 o successiva) oppure Windows 11
- Permessi di amministratore sulla macchina

## Passaggi di Installazione

### 1. Abilitare WSL
Aprire un terminale PowerShell con privilegi di amministratore ed eseguire il seguente comando:

```powershell
wsl --install
```

Questo comando abiliterà automaticamente i componenti richiesti e installerà l'ultima versione di Ubuntu disponibile.

Dopo l'installazione, riavviare il computer se richiesto.

### 2. Verificare la Versione di WSL
Dopo il riavvio, aprire il terminale e digitare:

```powershell
wsl -l -v
```

Se la versione di Ubuntu installata non è su WSL 2, eseguire il seguente comando per impostarla:

```powershell
wsl --set-version Ubuntu 2
```

Se si desidera impostare WSL 2 come predefinito per future installazioni, eseguire:

```powershell
wsl --set-default-version 2
```

### 3. Aggiornare il Kernel di WSL (se necessario)
Se richiesto, scaricare e installare manualmente il pacchetto di aggiornamento del kernel dal sito ufficiale di Microsoft:

[WSL Kernel Update](https://aka.ms/wsl2kernel)

### 4. Aprire Ubuntu e Configurarlo
Dopo l'installazione, avviare Ubuntu dal menu Start oppure eseguire:

```powershell
wsl
```

Al primo avvio verrà chiesto di creare un nuovo utente e una password.

### 5. Aggiornare il Sistema
Dopo l'avvio di Ubuntu, eseguire i seguenti comandi per aggiornare i pacchetti:

```bash
sudo apt update && sudo apt upgrade -y
```

### 6. Configurare un Nome Host Personalizzato (Opzionale)
Se si desidera modificare il nome host di Ubuntu in WSL, eseguire:

```bash
echo "mio-hostname" | sudo tee /etc/hostname
```

E riavviare WSL con:

```powershell
wsl --shutdown
```

### 7. Configurazione Avanzata (Opzionale)
Per un'integrazione più avanzata, è possibile:
- Configurare l'accesso ai file di Windows da WSL (`/mnt/c`)
- Impostare un server SSH
- Installare Docker con il supporto WSL 2

### 8. Disinstallare WSL (se necessario)
Se si desidera rimuovere WSL e Ubuntu:

```powershell
wsl --unregister Ubuntu
wsl --uninstall
```

## Conclusione
Ora hai WSL 2 installato e configurato con Ubuntu! 🎉

Per ulteriori informazioni, visita la documentazione ufficiale di Microsoft: [WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
