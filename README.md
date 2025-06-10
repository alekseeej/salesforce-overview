# Korišćenje Salesforce tehnologija za unapređivanje, automatizaciju i optimizovanje modernih poslovnih sistema

## Sadržaj
- [Problemi Koje Salesforce rešava](#problemi-koje-salesforce-rešava)
- [Šta je Salesforce](#%EF%B8%8F-šta-je-salesforce)
- [Podela na Ključne Salesforce Cloud-ove](#%EF%B8%8F-podela-na-ključne-salesforce-cloud-ove)
- [Osnovne tehnologije](#%EF%B8%8F-osnovne-salesforce-tehnologije)
- [Pokretanje i instalacija](#1-instalacija-salesforce-cli-command-line-interface)

## ❗Problemi koje Salesforce rešava
U mnogim savremenim sistemima, kompanije vode svoje poslovne strategije manuelno, ili kroz više sistema gde svaki ima svoju namenu. Neki čak i dalje pribegavaju beleženju podataka o potencijalnim saradnicima ili kupcima u Excel tabelama. 

Salesforce je osmišljen kao sveobuhvatna platforma za rešavanje najčešćih izazova sa kojima se suočavaju moderne organizacije u prodaji, podršci i marketingu.

Problemi koje ova platforma efikasno rešava su sledeći:

### 🔍 Nepovezani podaci o klijentima
Objedinjuje sve interakcije, kontakte, prilike i servise u jedan centralni sistem — omogućava 360° uvid u korisnika.

### 🧾 Ručni i neefikasni poslovni procesi
Automatizacijom kroz **Flow**, **Apex** i **Automation Rules**, smanjuje manuelni rad i ubrzava tokove posla.

### 🤝 Loša koordinacija timova
Omogućava deljenje podataka i zadataka između timova kroz kolaborativne alate i zajedničke zapise.

### 📉 Ograničena analitika i uvidi
Pruža real-time izveštaje, nadzorne table i prediktivne uvide putem **Einstein Analytics** i ugrađenih report builder-a.

### 🏗️ Težak razvoj aplikacija
Kao **PaaS platforma**, Salesforce omogućava brz razvoj prilagođenih aplikacija bez potrebe za komplikovanim backend sistemima.

### 🌐 Nepotpuno korisničko iskustvo
Kroz **Experience Cloud**, omogućava personalizovane portale, zajednice i digitalna okruženja za korisnike i partnere.

### 📊 Nepotpuna slika prodajnog ciklusa
**Sales Cloud** pokriva sve — od generisanja lead-ova do zaključenja prodaje, uz automatizovano praćenje i izveštavanje.

---

Salesforce je cloud platforma koja objedinjuje sve aspekte poslovanja na jednom mestu. Iako postoji pregršt savremenih CRM-ova danas, Salesforce je jedan od retkih koji nudi cloud za bilo koju potrebu kompanije koja ga koristi. Na taj način centralizuje servise, nudi olakšanje agentima u vidu automatizacije mnogih poslova, a takođe daje i slobodu uređivanja same platforme kako bi pratila brend kompanije. 

## ☁️ Šta je Salesforce?

**Salesforce** je vodeća cloud platforma za upravljanje odnosima sa klijentima (**CRM**), koja pomaže kompanijama da unaprede svoje procese u prodaji, podršci, marketingu i analitici.  

Kao **SaaS** i **PaaS** rešenje, Salesforce omogućava organizacijama da koriste gotove aplikacije (Sales Cloud, Service Cloud, Marketing Cloud itd.), ali i da razvijaju sopstvene poslovne aplikacije koristeći alate kao što su **Apex**, **Lightning Web Components**, **Flow** i drugi.

Glavna prednost Salesforce-a je što omogućava:
- centralizaciju podataka o korisnicima i procesima,
- automatizaciju svakodnevnih zadataka,
- jednostavno prilagođavanje potrebama kompanije,
- razvoj modernih aplikacija bez potrebe za infrastrukturom.

Danas Salesforce koriste milioni korisnika širom sveta, od malih timova do velikih enterprise sistema, jer nudi pouzdanu i fleksibilnu osnovu za digitalnu transformaciju poslovanja.
Salesforce nije ograničen samo na jednu vrstu industrije — koriste ga kompanije iz gotovo svih sektora: finansije, zdravstvo, obrazovanje, maloprodaja, proizvodnja, pa čak i nevladine organizacije.

Među korisnicima Salesforce-a nalaze se globalni brendovi poput Coca-Cola, Amazon, Toyota, Adidas, ali i mnoge manje firme koje žele skalabilno i moćno CRM rešenje.

Platforma se koristi kako u B2B tako i u B2C kontekstu — bilo da je reč o praćenju klijenata u banci, obradi zahteva u call centru, personalizaciji marketing kampanja ili izgradnji portala za partnere.

Upravo zahvaljujući svojoj fleksibilnosti, podršci za razvoj i bogatom ekosistemu aplikacija (AppExchange), Salesforce se izdvojio kao lider u digitalnoj transformaciji savremenog poslovanja.

## ☁️ Podela na ključne Salesforce Cloud-ove

Salesforce platforma je modularna i sastoji se od različitih "cloudova" – specijalizovanih aplikacija koje rešavaju konkretne poslovne potrebe.

### 🛒 Sales Cloud
Koristi se za upravljanje prodajnim procesom: od potencijalnih klijenata (leads) do zatvaranja prodaje.
- Praćenje lead-ova i prilika
- Automatizacija prodajnih koraka
- Forecasting i izveštavanje
- Email i aktivnost tracking

### 🎧 Service Cloud
Pruža podršku korisnicima kroz različite kanale (email, telefon, chat, portal).
- Ticketing sistem i case management
- Knowledge base i self-service portal
- SLA i eskalacije
- Omnichannel podrška (chat, social, voice)

### 📣 Marketing Cloud
Omogućava kreiranje personalizovanih marketinških kampanja na svim kanalima.
- Email i SMS kampanje
- Journey Builder (automatizacija putanje korisnika)
- Segmentacija korisnika
- Analitika i A/B testiranje

### 🌐 Experience Cloud
Služi za izradu portala i zajednica za korisnike, partnere ili zaposlene.
- Brza izrada portala bez koda
- Povezivanje sa podacima iz Salesforce-a
- Personalizacija sadržaja po korisniku
- Partner i customer community platforma

Gorepomenuti cloudovi predstavljaju samu suštinu Salesforce-a, međutim, to nije sve. Postoji još mnoštvo cloud-ova koji su dostupni korisnicima, poput Data Cloud-a, Consumer Goods Cloud-a, Media Cloud-a, ali da bismo ostali u domenu teme, ostaćemo pri najkorišćenijim rešenjima.
# 🛠️ Osnovne Salesforce tehnologije

Salesforce platforma omogućava razvoj savremenih poslovnih aplikacija korišćenjem više različitih tehnologija. Neke od njih omogućavaju rad bez koda, dok su druge namenjene programerima. U nastavku je pregled najvažnijih razvojnih tehnologija u Salesforce ekosistemu.

---

## 🧠 Apex

**Apex** je objektno-orijentisan programski jezik sličan Javi. Koristi se za implementaciju poslovne logike na serverskoj strani.

- ✅ Piše se u Developer Console, VS Code (sa Salesforce CLI), ili Setup > Apex Classes
- ✅ Omogućava kreiranje klasa, metoda, servisa, obrada grešaka i poslovnih pravila
- ✅ Pokreće se kroz trigger-e, Flow, REST API, Visualforce ili LWC

**Primer klase:**
```apex
public class DiscountCalculator {
    public static Decimal calculateDiscount(Decimal price, Decimal percent) {
        return price - (price * percent / 100);
    }
}
```
## ⚡ Lightning Web Components (LWC)

LWC je moderna tehnologija za izradu korisničkog interfejsa, bazirana na web standardima kao što su JavaScript, HTML i CSS.

✅ Razvoj se vrši u VS Code-u uz Salesforce Extension Pack

✅ Koristi se za pravljenje responzivnih i brzih UI komponenti

✅ LWC komponente se lako integrišu sa Apex klasama i Flow-ovima

```javascript
// helloWorld.js
import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    message = 'Zdravo, Salesforce!';
}
```
```html
<!-- helloWorld.html -->
<template>
    <p>{message}</p>
</template>
```

## 🧾 SOQL (Salesforce Object Query Language)
SOQL omogućava precizne upite nad Salesforce objektima.

✅ Koristi se za izvlačenje podataka (kao SQL)

✅ Piše se u Apex-u, Developer Console ili VS Code-u

```sql
SELECT Name, Email FROM Contact WHERE CreatedDate = LAST_N_DAYS:30
```
## 🔍 SOSL (Salesforce Object Search Language)
SOSL omogućava full-text pretragu kroz više objekata istovremeno.

```apex
FIND 'Aleksa' IN ALL FIELDS RETURNING Contact(Name), Account(Name)
```

## 🔁 Flow

Salesforce Flow omogućava vizuelno modelovanje automatizacije poslovnih procesa bez potrebe za kodiranjem.

✅ Pristupa se kroz Setup > Flows

✅ Tipovi: Screen Flow, Record-Triggered Flow, Scheduled Flow

✅ Može da poziva Apex kod, pravi zapise, ažurira podatke, šalje emailove

🎯 Odličan za korisnike koji žele da modeluju procese vizuelno.

<details>

<summary>Pokretanje i Instalacija</summary>

Da bi se započeo bilo kakav razvoj na Salesforce platformi, potrebno je da se pripremi razvojno okruženje koje će se povezati na Salesforce organizaciju tj. org koji je u upotrebi. Evo osnovnih koraka:

---

### 1. Instalacija Salesforce CLI (Command Line Interface)

Salesforce CLI omogućava upravljanje projektima, org-ovima i deployment koda preko komandne linije.

- Potrebno je preuzeti instalacioni paket sa zvaničnog sajta:  
  [https://developer.salesforce.com/tools/sfdxcli](https://developer.salesforce.com/tools/sfdxcli)
- Instalacija prateći uputstva za svoj operativni sistem (Windows, Mac, Linux)
- Provera uspešne instalacije komandom:
  ```bash
  sfdx --version
  ```
### 2. Kreiranje Salesforce Developer Org-a 

Developer Org je besplatan Salesforce nalog namenjen za učenje, razvoj i testiranje aplikacija.

---

  Koraci za kreiranje Developer Org-a

1. Otvoriti link za registraciju Developer orga:  
   [https://developer.salesforce.com/signup](https://developer.salesforce.com/signup)

2. Popuniti formular sa osnovnim podacima:  
   - Ime i prezime  
   - Email (koristiti svoj lični email)  
   - Korisničko ime (mora biti u formatu email-a, ali ne mora biti stvaran email, npr. `tvoje.ime@primer.com`)  
   - Lozinka  
   - Ostali podaci po potrebi

3. Kliknuti na "Sign me up" i sačekati da stigne potvrda na email. Ovaj korak može potrajati.

4. Potvrda email-a klikom na link iz Salesforce-a.

5. Prijaviti se na [https://login.salesforce.com](https://login.salesforce.com) koristeći korisničko ime i lozinku koje ste izabrali.

---

#### VS Code Konfiguracija

Potrebno je skinuti VS Code ekstenzije:

* Salesforce CLI Integration
* Salesforce Extension Pack
* Apex
* Lightning Web Components

#### Povezivanje Developer Org-a sa Salesforce CLI

Nakon kreiranja naloga i org-a, potrebno je povezati org sa radnim okruženjem:

```bash
sfdx auth:web:login -r https://login.salesforce.com
```

### 3. Deploy koda

Nakon povezivanja radnog okruženja, preuzmite kod iz repozitorijuma. 

Pronađite package.xml fajl, koji se nalazi unutar manifest foldera. 
Desnim klikom na package.xml fajl, videćete opciju Deploy Source in Manifest to Org.

Nakon uspešnog deploymenta, ulogujte se u org i testirajte primer.

