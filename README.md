# AsolFront – Delphi REST Client UI

A Windows desktop front end for the Asol Orders Demo back end. Built in Delphi (VCL) with RESTClient, this prototype handles user authentication with visual feedback and token handoff.

## Features

- Login dialog with:
  - Username/password inputs
  - JSON-based POST to `/auth/login`
  - RESTClient usage with `ExecuteAsync`
- JWT/Credentials + user info stored after login
- Main form. Has UserRole filtered form selection, tab system
- Dynamic form registration
- (Incomplete) Form for viewing (all) Orders
- Spring4D based Services
- State management system

## How to Use

1. Run the monolith back end locally (`asol-orders-demo\mono`)
2. Run the compiled .\Win32\Debug\AsolFront.exe
3. A login dialog will appear:
   - Use test credentials from your back end dataset
   - On success, the token will appear in the main form

## Future Work

- Add missing forms, finalize forms
- Display user info to user


