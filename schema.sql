-- Run this in Supabase: SQL Editor -> New query -> paste -> Run

create table if not exists people (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  added_on date not null default current_date,
  created_at timestamptz not null default now()
);

create table if not exists attendance (
  person_id uuid not null references people(id) on delete cascade,
  date date not null,
  created_at timestamptz not null default now(),
  primary key (person_id, date)
);

create table if not exists settings (
  id int primary key default 1 check (id = 1),
  cycle int not null default 3 check (cycle >= 2 and cycle <= 14)
);
insert into settings (id, cycle) values (1, 3) on conflict (id) do nothing;

create index if not exists attendance_date_idx on attendance (date);

-- Only logged-in users can read or write anything
alter table people enable row level security;
alter table attendance enable row level security;
alter table settings enable row level security;

create policy "auth all people" on people for all to authenticated using (true) with check (true);
create policy "auth all attendance" on attendance for all to authenticated using (true) with check (true);
create policy "auth all settings" on settings for all to authenticated using (true) with check (true);
