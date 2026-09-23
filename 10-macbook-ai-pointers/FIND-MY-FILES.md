# FIND-MY-FILES

Craig 2026-09-11: this Desktop stays empty on purpose. The only file that belongs here is this note.

Every former Desktop document now lives on the T9 drive. Do not write new files to this Desktop. Do not put shortcuts or aliases back.

## For any AI looking for a Desktop document

1. Confirm T9 is mounted at `/Volumes/T9` (volume UUID `94515852-7661-4813-95B6-526D6826E1DA`).
2. Look up the old Desktop name:

```sh
/Users/craigstratton/bin/prosper-find-document 'NAME'
/Users/craigstratton/bin/prosper-desktop-file lookup 'NAME'
```

3. Human map: `/Volumes/T9/_MAP/DESKTOP-FILING.md`
4. Machine registry: `/Volumes/T9/_MAP/desktop-file-locations.json`
5. Local registry if T9 is unplugged: `/Users/craigstratton/.local/share/prosper-desktop-filing/desktop-file-locations.json`
6. Shared-desk instructions: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/FILE-LOCATIONS.md`
7. Drive front door: `/Volumes/T9/START_HERE.md`

New files go to the numbered T9 zones, or `/Volumes/T9/00_INBOX/` if unsure.

Hourly filing still runs through `/Users/craigstratton/bin/prosper-desktop-file`. It must leave this note in place and must not recreate Desktop shortcuts.
