# Daily Attendance

3-day cycle attendance tracker. Static site (GitHub Pages) + Supabase (Postgres) database.

## Rules
- Marked present on day N → hidden for the next (cycle − 1) days → shows again on day N + cycle (default 3).
- Visible on the last 3 attendance days and never marked present → goes to the "3 consecutive absences" box.

## Setup

### 1. Database (Supabase, free)
1. Create a project at https://supabase.com.
2. Go to **SQL Editor → New query**, paste everything in `schema.sql`, click **Run**.

### 2. Login (so only you/your team can edit)
1. **Authentication → Users → Add user → Create new user**. Enter an email and password, and tick *Auto Confirm User*.
2. **Authentication → Sign In / Providers (or Settings)** → turn **off** "Allow new users to sign up".
   Create more users the same way for anyone else who needs access.

### 3. Connect the app
1. **Project Settings → API**. Copy the **Project URL** and the **anon public** key.
2. Open `index.html` and replace `YOUR_SUPABASE_URL` and `YOUR_SUPABASE_ANON_KEY` near the top of the script.
   The anon key is safe to be public because the database only allows logged-in users (Row Level Security is on).
   Never put the `service_role` key in this file.

### 4. Put it on GitHub
1. Create a repo and push `index.html`, `schema.sql`, and `README.md`.
2. **Settings → Pages → Deploy from a branch → main / (root)**.
3. Your site will be at `https://<username>.github.io/<repo>/`.
