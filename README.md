# LeetCode Pattern Playbooks

This workspace collects latex sources for interview cheat sheets and pattern playbooks. Each template lives under `templates/` and produces a PDF in `pdf/` via the build script.

## Quick Start

```bash
./scripts/build_all.sh
```

The script compiles every `.tex` file beneath `templates/`, routing intermediate files into `build/<topic>/` and dropping finished PDFs into `pdf/`:

- `pdf/master_leetcode_templates.pdf`
- `pdf/graph_leetcode_templates.pdf`

LaTeX runs with LuaLaTeX so emojis, `fontspec`, and `minted` all work out of the box. If you add a new playbook, create a new folder under `templates/` (for example, `templates/heaps/`) and rerun the build script.

## Directory Layout

- `templates/` – LaTeX sources grouped by topic
- `pdf/` – compiled playbooks, ready to share
- `build/` – per-topic aux files and minted caches
- `scripts/` – helper scripts (currently `build_all.sh`)
- `scratch/emoji/` – experimental emoji documents kept for reference

## Notes

- Keep new LaTeX files ASCII unless you have a strong reason to introduce Unicode.
- `minted` requires Python and Pygments; they are expected to be available on the host running the build.
- To force a clean rebuild for a topic, remove its folder under `build/` first.
