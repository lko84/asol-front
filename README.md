# AsolFront – Delphi REST Client UI

A Windows desktop front end for the Asol Orders Demo back end. Built in Delphi (VCL) with RESTClient, this prototype handles user authentication with visual feedback and token handoff.

## Features

- Login dialog with:
  - Username/password inputs
  - JSON-based POST to `/auth/login`
  - RESTClient usage with `ExecuteAsync`
- Temporary main form with token display
- Minimal coupling to main UI until login success

## How to Use

1. Locally run the monolyth back end (`asol-orders-demo\mono`)
2. Run the compiled .\Win32\Debug\AsolFront.exe
3. A login dialog will appear:
   - Use test credentials from your back end dataset
   - On success, the token will appear in the main form

## Future Work

- Abstract REST logic into a shared class
- Store token for future authenticated requests
- Add error logging and user feedback
- Add missing forms
- Style forms