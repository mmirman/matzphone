# Hardware requirements for the launch device

What we will ask of an ODM/OEM partner for a high-end device shipping
MatzPhone as factory firmware. These requirements exist to make the OS's
security and longevity promises actually deliverable.

## Non-negotiable

| Requirement | Why |
|---|---|
| Unlockable + **re-lockable** bootloader with user-settable AVB root of trust | Verified boot for owners, not just for us |
| SoC with GKI kernel support and >= 5 years of vendor BSP updates (e.g. Snapdragon 8-series with extended support agreement) | Our 5-year update promise is impossible otherwise |
| Source-available kernel tree at launch (GPL compliance, day one) | Legal + community bring-up |
| Dedicated secure element or equivalent (StrongBox) | Hardware keystore claims |
| No carrier/ODM preload requirements | Clean OS image |

## Strongly preferred

- Hardware kill switch or firmware-level toggle for cameras/mics
- Replaceable battery or >= 800-cycle battery with published spec
- 3 SKUs max (RAM/storage variants only) to keep the update matrix small
- IP68, flagship-class camera stack with open enough HAL to maintain

## Deal structure we want

- ODM manufactures and certifies; MatzPhone project controls the signing
  keys and OTA channel.
- Firmware/BSP escrow so updates survive a partner exit.
- MOQ and unit economics to be negotiated — realistic flagship MOQ is
  10k–50k units; this phase requires funding and is gated on Phase 2
  completion and capital, not on engineering alone.
