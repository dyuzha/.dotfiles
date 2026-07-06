---
name: python-architecture-patterns
description: Guides Python development using TDD, DDD, ports and adapters, Repository, Unit of Work, aggregates, events, message bus, CQRS, and dependency injection patterns from Architecture Patterns with Python. Use for Python architecture, pseudocode, feature design, refactoring, testing strategy, service-layer design, domain modeling, and event-driven workflows.
---

# Python Architecture Patterns

Use this skill when developing Python systems in the spirit of *Architecture Patterns with Python* by Harry Percival and Bob Gregory. Treat the book as an architectural compass, not as a template to copy blindly.

## Core Bias

Prefer designs where:

- Business rules live in an explicit domain model, not in framework handlers, ORM models, or scripts.
- Tests describe behavior before implementation details.
- Dependencies point inward: domain code does not depend on databases, web frameworks, queues, or external APIs.
- Infrastructure is replaceable through ports and adapters.
- Complexity is introduced only when the use case justifies it.

## Development Loop

For feature work, follow this loop:

1. Clarify the business behavior in the user's language.
2. Sketch the domain model or pseudocode before touching infrastructure.
3. Write or propose a failing test at the right level.
4. Implement the smallest useful domain behavior.
5. Add a service layer when a use case coordinates domain objects, repositories, or transactions.
6. Introduce adapters only after the core behavior is clear.
7. Refactor toward clearer boundaries once tests protect the behavior.

When pseudocoding, still separate:

- Domain behavior and invariants.
- Application/service orchestration.
- Ports such as repositories, gateways, publishers, or clocks.
- Adapters such as SQLAlchemy, Flask/FastAPI, Celery, Redis, Kafka, files, or external APIs.

## TDD Guidance

Use tests as a design tool:

- Start with fast unit tests for pure domain behavior.
- Use service-layer tests with fakes for orchestration and error paths.
- Use integration tests for real repositories, Unit of Work, database mappings, and infrastructure adapters.
- Use end-to-end tests sparingly for confidence across boundaries.
- Prefer "high gear" tests for broad behavior and "low gear" tests for detailed domain rules.

Do not couple all tests to implementation details. If a test becomes brittle, check whether it belongs at a higher architectural level.

## Domain Modeling

Before choosing a pattern, ask:

- What are the entities, value objects, and domain services?
- Which invariants must always hold?
- What is the aggregate boundary for those invariants?
- What language does the business use for this behavior?
- Which errors are domain errors rather than transport or persistence errors?

Use entities when identity matters. Use value objects when equality by value is enough. Use domain services for operations that do not naturally belong to one entity.

## Repository And Unit Of Work

Reach for Repository when the domain needs collection-like access to aggregates without knowing storage details.

Use Unit of Work when a use case needs:

- A clear transaction boundary.
- Coordinated changes across repositories.
- Explicit commit and rollback behavior.
- A place to collect and publish domain events after successful persistence.

Keep repositories focused on aggregate roots. Avoid leaking ORM query objects or database sessions into domain code.

## Aggregates

Use aggregates to protect consistency boundaries:

- One aggregate should enforce one coherent set of invariants.
- Prefer one repository per aggregate root.
- Keep aggregates small enough to avoid unnecessary contention.
- Use optimistic concurrency when concurrent updates can violate invariants.
- Do not force every relationship into one aggregate; eventual consistency is often acceptable between aggregates.

## Events And Message Bus

Use domain events when something meaningful happened in the domain and other workflows may react to it.

Prefer:

- Commands for requests to do something.
- Events for facts that already happened.
- Handlers for application workflows.
- A message bus when multiple handlers, commands, or events need consistent dispatch.

Publish events after successful commits unless the use case explicitly requires otherwise. Keep event handlers idempotent when messages may be retried.

## CQRS

Separate command and query paths when read needs and write invariants pull the design in different directions.

Use CQRS when:

- Read models need different shapes from write models.
- Optimized queries would pollute the domain model.
- Event-driven projections make the system simpler.

Do not introduce CQRS for ordinary CRUD unless it removes real complexity.

## Dependency Injection

Prefer explicit composition at application startup:

- Wire repositories, Unit of Work, message bus, handlers, gateways, clocks, and publishers in one bootstrap/composition area.
- Pass dependencies into services and handlers instead of importing globals.
- Use fakes in tests at port boundaries.

Avoid hiding important dependencies behind module-level singletons.

## Response Style

When applying this skill, include the architectural reasoning briefly:

- "Domain model": the core behavior and invariants.
- "Test first": the first useful test or test level.
- "Boundary": which ports/adapters are needed.
- "Pattern fit": why Repository, UoW, events, CQRS, or DI are used or intentionally skipped.

For small tasks, keep this implicit and just make the code better. For design or pseudocode tasks, make the reasoning visible.

## Avoid

- Putting business rules in controllers, serializers, ORM models, CLI commands, or message consumers.
- Mocking the database when an integration repository test would be clearer.
- Adding Repository, UoW, message bus, or CQRS before there is a real boundary or coordination problem.
- Letting framework structure dictate the domain model.
- Treating events as a substitute for clear synchronous command handling.
