# বাকি খাতা (Baki Khata)

বাংলাদেশের ছোট দোকানদারদের জন্য একটি সহজ, offline-first customer credit/debt management Android অ্যাপ।

> **অবস্থা:** প্রকল্প শুরু হয়েছে — Phase 0 (Project Foundation) সম্পন্ন। এখনো কোনো feature সম্পূর্ণ implement হয়নি।

---

## কেন এই অ্যাপ?

মুদি দোকান, কাপড়ের দোকান, মোবাইল দোকান, হার্ডওয়্যার দোকান বা যেকোনো ছোট ব্যবসায় দোকানদাররা এখনো
কাগজের খাতায় গ্রাহকদের বাকির হিসাব রাখেন। "বাকি খাতা" সেই কাগজের খাতাকে মোবাইলে নিয়ে আসে —
সহজ, ইন্টারনেট ছাড়াই কাজ করে, এবং কোনো প্রশিক্ষণ ছাড়াই ব্যবহার করা যায়।

## Features

### প্রথম Version (পরিকল্পিত)
- গ্রাহক যোগ/সম্পাদনা/মুছে ফেলা/খোঁজা
- নতুন বাকি ও পরিশোধ (জমা) যোগ করা
- স্বয়ংক্রিয় বর্তমান পাওনা হিসাব
- সম্পূর্ণ লেনদেনের ইতিহাস
- ড্যাশবোর্ডে মোট পাওনা, আজকের আদায়, আজকের নতুন বাকি
- JSON ভিত্তিক ব্যাকআপ ও রিস্টোর
- WhatsApp/SMS reminder-এর ভিত্তি
- PIN lock-এর জন্য architecture (ভবিষ্যতে সক্রিয় হবে)

## Screenshots

_শীঘ্রই যোগ হবে — feature implementation-এর পর।_

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| Database | SQLite (sqflite) |
| State Management | Provider |
| Navigation | go_router |
| Backup Format | JSON |

প্রথম Version-এ Firebase, cloud database, login system বা payment gateway ব্যবহার করা হচ্ছে না —
অ্যাপটি সম্পূর্ণ local/offline-first।

## Architecture

```
lib/
├── core/           # constants, theme, routing, utils, errors — সব feature-এ shared
├── data/           # database helper, models, repositories
├── features/       # dashboard, customers, transactions, settings (প্রতিটি self-contained)
└── shared/         # পুনর্ব্যবহারযোগ্য widget
```

UI, database এবং business logic আলাদা রাখা হয়েছে — repository pattern ব্যবহার করে
data layer-কে UI থেকে আলাদা করা হয়েছে যাতে ভবিষ্যতে cloud sync যোগ করা সহজ হয়।

## Installation

```bash
git clone <repository-url>
cd baki_khata
flutter pub get
```

## Run

```bash
flutter run
```

## Testing

```bash
flutter test
```

Balance calculation ও repository-এর মূল business logic-এর জন্য unit test থাকবে (`test/` ফোল্ডার)।

## Roadmap

| Phase | বিষয় | অবস্থা |
|---|---|---|
| 0 | Project Foundation | ✅ সম্পন্ন |
| 1 | Database Layer | ⏳ পরিকল্পিত |
| 2 | Customer Management | ⏳ পরিকল্পিত |
| 3 | Transaction System | ⏳ পরিকল্পিত |
| 4 | Dashboard | ⏳ পরিকল্পিত |
| 5 | Search | ⏳ পরিকল্পিত |
| 6 | Backup/Restore (JSON) | ⏳ পরিকল্পিত |
| 7 | Reminder ভিত্তি | ⏳ পরিকল্পিত |
| 8 | PIN Lock ভিত্তি | ⏳ পরিকল্পিত |
| 9 | Testing | ⏳ পরিকল্পিত |
| 10 | UI Polish | ⏳ পরিকল্পিত |

## Future Features (এই Version-এর বাইরে)

- Cloud sync (multi-device)
- সক্রিয় PIN lock / biometric lock
- সরাসরি WhatsApp/SMS reminder পাঠানো
- একাধিক দোকান/branch সাপোর্ট
- Multi-language (এখন শুধু বাংলা)

## License

_এখনো নির্ধারিত হয়নি।_
