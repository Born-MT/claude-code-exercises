# Clients and products

Last reviewed: 2026-10-01 · Owner: Head of Delivery

*Fictional example.*

| Client or product | What it is, in one line | Repositories | Lead | Notes Claude needs |
|-------------------|-------------------------|--------------|------|--------------------|
| Harbour Books (key `HRB`) | Online bookshop: catalogue, cart, checkout | `lantern/harbour-shop`, `lantern/harbour-cms` | Delivery lead, Harbour | Card payments go through the payment provider only; we never store card data |
| Meadow Health (key `MDW`) | Appointment booking for clinics | `lantern/meadow-booking` | Delivery lead, Meadow | Regulated: no patient data outside their hosting; test data only from `fixtures/` |
| Lamp (key `LMP`) | Our internal component library, used by both clients | `lantern/lamp` | Frontend lead | Changes affect every client; a breaking change needs a major version |

Repositories not listed here: ask the Head of Delivery before assuming which client they
belong to.
