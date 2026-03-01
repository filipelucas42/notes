# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal technical notes site built with **MkDocs** (Material theme). All content is Markdown files under `docs/`. The site is deployed to AWS S3 + CloudFront.

## Commands

- **Local dev server:** `python3 -m mkdocs serve`
- **Build site:** `make build` (runs `python3 -m mkdocs build`, outputs to `site/`)
- **Deploy:** `make deploy` (builds, syncs to S3, invalidates CloudFront cache)

## Structure

- `docs/` — Published notes, organized by topic (databases, linux, programming_languages, etc.)
- `in_progress/` — Draft notes not yet published
- `mkdocs.yml` — MkDocs configuration (Material theme, `use_directory_urls: false`)
- `files/` — Static files/assets

## Content Conventions

- Notes are concise, reference-style Markdown — code snippets, commands, and brief explanations
- Guiding principle from index page: "Make it correct, make it clear, make it concise, make it fast. In that order."
