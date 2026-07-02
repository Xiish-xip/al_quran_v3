# Data Sources

This project requires a large hadith database file that is excluded from the git repository due to its size (~166MB).

## Required Database Files

### 1. Hadith Database (Arabic + English)
- **Path**: `assets/databases/hadith.ar-en.v2.db`
- **Size**: ~166MB
- **Source**: Generate using the import scripts from the related `quran-ios-main` project:
  ```bash
  # From the quran-ios-main project
  python Tools/HadithDataImporter/import_hadith_json.py
  ```
  Then copy the resulting database to this project's `assets/databases/` directory.

### 2. Quran Script Data (already tracked in git)
- **Path**: `assets/quran_script/Indopak.json` (~3.4MB)
- **Path**: `assets/quran_script/QPC_Hafs_Tajweed_Compress.json` (~3.3MB)
- These files are already included in the repository as they are reasonably sized.

## How to Get the Hadith Database

### Option 1: Generate from the iOS project tools
The `quran-ios-main` project contains Python import tools in its `Tools/HadithDataImporter/` directory:

```bash
# Clone the iOS project
git clone <quran-ios-main-repo-url>
cd quran-ios-main
python Tools/HadithDataImporter/import_hadith_json.py
# The output database can then be copied to this project
```

### Option 2: Download from the original repository
The data was originally sourced from the [al_quran_v3](https://github.com/IsmailHosenIsmailJames/al_quran_v3) repository. You can clone that repo and copy the database:

```bash
git clone https://github.com/IsmailHosenIsmailJames/al_quran_v3.git temp-quran
cp temp-quran/assets/databases/hadith.ar-en.v2.db assets/databases/
rm -rf temp-quran
```

## Getting Started

1. Clone this repository
2. Download or generate the hadith database (see above)
3. Place it at `assets/databases/hadith.ar-en.v2.db`
4. Run `flutter pub get`
5. Run `flutter run`