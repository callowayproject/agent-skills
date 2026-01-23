# Skills

## Overview

When [Anthropic released skills](https://agentskills.io/specification) in October 2025, everyone ran into the same puzzle: **skills, commands, and agents all looked identical on disk**. They’re all Markdown files with prompts. Structurally, the same. Conceptually different.

To work productively with them, you need a coherent directory structure that reflects how these components are meant to behave at runtime. The following layout provides that clarity.

## Structural Model

- **Skills**  
    Domain containers. Each skill represents a cohesive capability area (blogging, research, security).

- **Commands**  
    Domain-specific tasks are stored in each skill under `workflows/`. Commands are the verbs of the domain.

- **References**  
    Reusable reference material located in the skill directory. Reference files are supporting knowledge, formatting rules, patterns, examples, etc.

- **Tools**  
    Shell-executable scripts providing real-world capabilities. Tools live in `scripts/` and can be invoked by commands or agents.

- **Agents**  
    Standalone workers that can run skills and commands in parallel. Agents live outside skills and never contain commands.

This resolves a key confusion: **agents do not live inside skills**, but they _can_ execute them. Skills contain commands; commands reference context; agents call the whole stack.

## Directory Structure

```
~/.claude/
├── skills/
│   └── blogging/
│       ├── SKILL.md
│       ├── examples.md
│       ├── formatting.md
│       ├── workflows/
│       │   ├── write.md
│       │   ├── publish.md
│       │   └── rewrite.md
│       └── scripts/
│           └── publish.sh
└── agents/
    ├── engineer.md
    ├── architect.md
    ├── pentester.md
    ├── researcher.md
    └── intern.md
```

## Skills (domain containers)

**When to use:** Organizing a domain of related capabilities.

A skill is a self-contained module representing a domain. Everything the domain needs lives inside this directory: commands, context, and any special tools.

```
~/.claude/skills/blogging/
├── SKILL.md
├── workflows/
│   ├── write.md
│   ├── publish.md
│   └── rewrite.md
├── voice.md
└── formatting.md
```
A request like “write a blog post” activates the `blogging` skill, which inspects the request and routes to `workflows/write.md`.

**Key insight:**  
A skill is just a Markdown router with local files. It’s a domain, not a function.

## Commands (task-level workflows)

**When to use:** A task within a domain.

Commands are just Markdown prompt files stored in the skill's `workflows/` directory. They define the exact behavior for writing a post, formatting a report, analyzing a URL, etc.

`skills/blogging/workflows/write.md` is a command. It’s the same format as traditional commands; it just lives in the right folder now.

**Key insight:**  
Commands didn’t disappear. They moved to where they logically belong.

## References (supporting knowledge)

**When to use:** Shared supporting instructions across multiple commands.

Reference files store reusable information: style guides, examples, schemas, best practices. Commands reference them rather than embedding large blocks of reusable text.

Example:  
`skills/blogging/formatting.md` contains front matter rules and structural guidance.

**Key insight:**  
Reference files isolate the parts you frequently refine.

## Tools (external capabilities)

**When to use:** You need filesystem or API access.

Tools are shell scripts that perform side-effectful actions, such as deploying a post, calling a research API, fetching logs, or scanning a repo. The results are reproducible and deterministic. Use tools to provide concrete information for the Agent.

**Key insight:**  
Tools expand the model’s reach beyond text-only reasoning.

## Agents (parallel workers)

**When to use:** Concurrent execution of tasks.

Agents are standalone Markdown files in `~/.claude/agents/`. They operate independently and can call skills, commands, and tools.

Example workflow:

1. You ask to research a topic
2. The `research` skill launches several `intern` agents
3. Each intern handles a different source
4. All results land at once for synthesis

**Key insight:**  
Agents are operators, not containers.

## Benefits

- **Encapsulation**  
    Each domain is a neat, self-contained module.
    
- **Discoverability**  
    Explore a skill’s workflows by opening its `workflows/` directory.
    
- **Portability**  
    A skill directory can be zipped up and shared; it will work anywhere.
    
- **Intent-based routing**  
    Natural-language requests automatically activate the correct workflow.
    
- **Modularity**  
    Replace monolithic prompt files with clear, well-scoped components.


## Writing skills

### Skills Template

A template for writing skills is available in `template/SKILLS.md`.

### Naming conventions

Use consistent naming patterns to make Skills easier to reference and discuss. 
We recommend using the **gerund form** (verb + -ing) for Skill names, 
as this clearly describes the activity or capability the Skill provides.

Remember that the `name` field must use lowercase letters, numbers, and hyphens only.

**Good naming examples (gerund form)**:

- `processing-pdfs`
- `analyzing-spreadsheets`
- `managing-databases`
- `testing-code`
- `writing-documentation`

**Acceptable alternatives**:

- Noun phrases: `pdf-processing`, `spreadsheet-analysis`
- Action-oriented: `process-pdfs`, `analyze-spreadsheets`

**Avoid**:

- Vague names: `helper`, `utils`, `tools`
- Overly generic: `documents`, `data`, `files`
- Reserved words: `anthropic-helper`, `claude-tools`
- Inconsistent patterns within your skill collection

### Description

Claude scans descriptions at startup to decide which Skills exist and when to use them. 
This happens before it reads any of your actual instructions. 
If the description is specific and condition-based, it works like magic.

```
description: Extract text and tables from PDF files, fill forms, merge documents. Use when working with PDF files or when the user mentions PDFs, forms, or document extraction.
```

This is specific, proactive, and describes the exact trigger condition. Claude knows precisely when to load it.

The key pattern: **“Use when [condition].”**


## Resources

- [Agent Skills](https://agentskills.io/home)
- [Model Context Protocol](https://modelcontextprotocol.io/)
- [Vercel Skills installer](https://skills.sh/docs)
