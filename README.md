# GitHub Actions Caching Examples

This repository contains working GitHub Actions workflows demonstrating caching strategies to speed up CI/CD pipelines for Docker, Python, and Node.js projects.

## Workflows Included

1. **Docker Image Caching**
   - Uses Docker Buildx cache exporters to persist and reuse Docker layers.
   - Cuts Docker build times from minutes to seconds.

2. **Python Dependency Caching**
   - **Traditional pip cache**: caches downloaded wheels in `~/.cache/pip`.
   - **Virtual environment cache**: caches the entire `.venv` for instant environment setup.

3. **Node.js Caching**
   - Uses the `actions/setup-node` action with `cache: 'npm'` to persist npm registry cache.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/CodeWithHitesh/github-actions-caching.git
   ```

2. Explore the workflow files in `.github/workflows/`.

3. Adapt the examples to your own projects by updating paths, keys, and lockfiles.

## More Information

For a detailed walkthrough, real-world metrics, and a narrative on how these strategies rescued my sanity at 3 AM, check out my Medium article:

**The Great Speed Heist: How I Turned My Sluggish GitHub Actions into Lightning-Fast Workflows**  
https://medium.com/@hiteshmalhotra622/the-great-speed-heist-how-i-turned-my-sluggish-github-actions-into-lightning-fast-workflows-8f7a32478989

---

Feel free to file issues or pull requests with enhancements, questions, or feedback!