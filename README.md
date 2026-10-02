# ecopam

A new Flutter project.

I don't have anything filed yet about EcoPam specifically — this looks like a new project. But based on everything you've shared in this conversation (the code structure, screens, and data model), here's a description built from what I can see in the app itself:

EcoPam is a campus waste management mobile app built with Flutter, designed for use at Universitas Pamulang. It connects three user roles — mahasiswa (students), CS (cleaning staff), and Sarpras (facilities team) — around a shared reporting and resolution workflow:

- **Students** log in with a campus email and can report trash/cleanliness issues by location (building, floor, specific spot), optionally with photo evidence. Verified reports earn Eco-Points as an incentive system.
- **CS staff** see an auto-prioritized queue of reported tasks (urgent / normal / handled), sorted by time remaining before auto-close, and can mark tasks as resolved.
- **Sarpras (facilities) staff** monitor the status of physical trash units across campus (sufficient / needs more capacity / frequently full) and can request new units be installed at specific locations.

The app currently runs on an in-memory mock data store (`MockDataStore`) rather than a live backend, so all functionality — reporting, task resolution, unit requests — works within a session for demo/prototyping purposes. The UI follows a clean, card-based design with a dark green primary theme.
Want me to adjust the tone (more technical/README-style vs. more pitch-style for a presentation), or add anything about the tech stack / architecture?
