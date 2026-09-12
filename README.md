# Jose Vera — Machine Learning Engineer

Focus areas:
- Production ML systems and deployment
- LLM-based applications (RAG, agents, structured querying)
- Data-driven decision systems (time series, anomaly detection)
- Cloud automation and validation workflows

---

## Project Navigation

| Project | Area | Focus |
|---|---|---|
| [conversational-analytics-bot](#1-conversational-analytics-bot--azure--llm) | LLM / Systems | NL → SQL, Azure, multi-channel |
| [Inventory Automation Portfolio](#2-inventory-automation-portfolio--azure-functions--power-bi--sharepoint) | Data / Systems | Azure Functions, DAX, Graph API, validation |
| [Battery Decision System](#3-battery-decision-system-tabnet) | ML | TabNet vs XGBoost, class imbalance, feature engineering |
| [ONNX Deployment](#4-model-deployment-with-onnx) | Systems | Framework-agnostic inference, model optimization |
| [FDA 510(k) Document Intelligence](#5-fda-510k-document-intelligence) | Healthcare / AI | PDF extraction, OCR, evidence-backed device relationships |
| [Text Classification](#additional-projects) | NLP | Embedding-based classification, multi-class |
| [Fake News Classifier](#additional-projects) | NLP | Baseline NLP modeling, Naive Bayes from scratch |
| [PDF Data Extraction](#additional-projects) | Data Engineering | Hybrid PDF parsing (text + OCR), LLM structuring |

---

## Featured Projects

### 1. Conversational Analytics Bot — Azure + LLM

Built a domain-agnostic conversational analytics bot that allows business users to ask natural-language questions about structured data and receive database-backed answers directly in chat. The system uses Azure OpenAI to interpret user intent, generate validated SQL, execute queries, and return formatted results through Adaptive Cards.

--Problem:-- Business users often need answers from structured databases but may not know SQL, database schemas, or where specific metrics live. This creates dependency on analysts and engineers for routine reporting questions, slowing down exploratory analysis and operational decision-making.

--Why it matters:-- The bot reduces friction between business questions and operational data by making analytics more self-service. Instead of submitting requests or writing SQL manually, users can ask questions conversationally and receive structured, query-backed responses. The architecture is reusable across domains by swapping the schema, prompts, and database configuration.

--Key technical components:--
- Microsoft Bot Framework: Conversational bot interface with aiohttp routing through /api/messages, suitable for Microsoft Teams-style or Web Chat interactions.
- Azure OpenAI: Intent routing, natural-language interpretation, SQL generation, and response synthesis.
- Natural-language-to-SQL pipeline: Converts user questions into SQL, validates generated queries, executes them against a structured database, and returns database-backed answers.
- SQL validation and formatting: Adds safeguards to reduce malformed or unsafe SQL execution before queries are run.
- Adaptive Cards: Presents query results in a structured, chat-native format instead of plain text only.
- Authentication: Uses Bot Framework OAuthPrompt to manage user sign-in before accessing analytics functionality.
- State management: Supports Azure Cosmos DB for persistent bot state, with an in-memory fallback for local development.

--Repo:-- [Conversational Analytics Bot App](https://github.com/joseosvaldo16/conversational-analytics-bot)


---

### 2. Inventory Automation Portfolio — Azure Functions + Power BI + SharePoint

Built a serverless automation pipeline that generates a recurring Excel-based report by querying a Power BI semantic model with DAX, populating a SharePoint-hosted workbook template, validating the output against live source data, and publishing artifacts back to SharePoint with notification support.

--Problem:-- Operational reporting pipelines often rely on manual spreadsheet updates, copy-paste workflows, and fragile handoff steps between analytics and business teams. That makes recurring reporting slow, error-prone, and difficult to audit.

--Why it matters:-- This project demonstrates how to turn a spreadsheet-driven reporting process into a production-style automation workflow with validation gates, cloud auth, structured artifacts, and serverless execution. It highlights the engineering side of analytics automation, not just model building.

--Key technical components:--
- Azure Functions: HTTP and timer triggers for on-demand and scheduled execution.
- Power BI + DAX: Pulls structured report sections directly from a semantic model through REST API calls and generated DAX queries.
- SharePoint / Microsoft Graph: Downloads the template workbook, uploads generated outputs, and manages artifact folders programmatically.
- Excel automation: Uses `openpyxl` to populate multi-sheet workbooks while preserving template structure and formatting.
- Validation layer: Rebuilds expected workbook values from source data and blocks publishing when mismatches are detected.
- Auth strategy design: Supports managed identity, client credentials, and Azure CLI fallback depending on runtime environment.
- Notification artifacts: Produces machine-readable and human-readable run outputs for success/failure reporting.

--Repo:-- [Inventory Automation Portfolio](https://github.com/joseosvaldo16/Inventory_Metrics_Automation)

---

### 3. Battery Decision System (TabNet)

--Problem:-- Classify battery state under domain-specific constraints and evaluate whether a more expressive architecture (TabNet) outperforms an existing XGBoost baseline on imbalanced data.

--Why it matters:-- Real-world classification problems often involve class imbalance and domain constraints that make standard accuracy metrics misleading — this project addresses both.

--Key technical components:--
- TabNet vs XGBoost comparison under class imbalance conditions
- Feature engineering tailored to battery domain characteristics
- Evaluation focused on F1-score rather than raw accuracy
- Analysis of model behavior under dataset constraints

--Repo:-- [Battery Decision](https://github.com/joseosvaldo16/Internship_Projects/tree/main/Battery_Decision)

---

### 4. Model Deployment with ONNX

--Problem:-- Deploy a PyTorch-trained model for inference in a framework-agnostic runtime, decoupling training from serving.

--Why it matters:-- Demonstrates understanding of the training-inference boundary — a key concern in production ML systems.

--Key technical components:--
- PyTorch → ONNX export pipeline
- ONNX Runtime inference setup
- Separation of training and inference environments
- Cross-framework compatibility verification

--Repo:-- [Deploying_With_ONNX](https://github.com/joseosvaldo16/Deploying_With_ONNX)

---

### 5. FDA 510(k) Document Intelligence

Built a healthcare document intelligence workflow that turns public FDA 510(k) submissions into structured, evidence-backed records of predicate and reference device relationships.

--Problem:-- Regulatory reviewers must search long, inconsistent PDFs and scanned pages to identify device relationships and verify the supporting evidence manually.

--Why it matters:-- The workflow reduces manual document review while keeping page-level source evidence attached to every extracted relationship, making results easier to verify and reuse in regulatory datasets or document-review applications.

--Key technical components:--
- PDF text extraction with `pypdf` and `pdfplumber`, with selective Azure Document Intelligence OCR for problematic pages
- Rule-based matching that distinguishes primary predicates, additional predicates, and reference devices
- Optional Azure OpenAI review with Pydantic-validated structured responses
- Evidence validation that preserves source text, page numbers, and review status
- JSONL, CSV, and Parquet exports for downstream analysis

--Repo:-- [FDA 510(k) Document Intelligence](https://github.com/joseosvaldo16/fda-510k-document-intelligence)

---

## Engineering Capabilities Demonstrated

- --LLM system design-- — multi-step prompting, schema grounding, structured outputs, retrieval
- --Workflow automation and validation-- — serverless pipelines, artifact generation, data-quality gates
- --Model deployment-- — ONNX export, API-based serving, Azure cloud deployment
- --Data pipelines and feature engineering-- — structured and unstructured data (SQL, PDF, text)
- --Model evaluation and error analysis-- — F1-score, class imbalance handling, baseline comparison
- --Containerization and cloud-- — Azure Bot Services, Azure App Services, Docker-ready setups

---

## System Design Focus

```
Data Source → Preprocessing → Model / LLM → API Layer → User / Application
```

Projects emphasize:
- Separation of training vs inference pipelines
- API-based model serving (Azure, ONNX Runtime)
- Data validation and preprocessing layers (schema grounding, OCR, embeddings)
- Modular code structure for maintainability and reproducibility

---

## Design Considerations

Tradeoffs addressed across projects:

- --Latency vs accuracy-- — multi-step LLM pipelines improve accuracy at the cost of latency; the conversational analytics bot targets ~5s end-to-end
- --Model complexity vs interpretability-- — TabNet chosen over deep networks for structured tabular data where feature attribution matters
- --LLM cost vs quality-- — multi-step GPT-4 calls increase cost but reduce hallucinated SQL; schema grounding reduces invalid query rates
- --Handling class imbalance-- — battery classification evaluated on F1-score rather than accuracy to avoid misleading results on skewed distributions
- --Framework lock-in-- — ONNX deployment explicitly targets cross-framework portability over single-framework optimization

---

## Running the Projects

Most projects include environment configuration and reproducible pipelines. General setup pattern:

```bash
# Clone the individual project repository
git clone <repo-url>
cd <project-directory>

# Install dependencies
pip install -r requirements.txt

# Follow the project-specific README for data setup and execution
```

Projects with cloud dependencies (Azure) include configuration templates for service credentials and endpoint setup.

---

## Additional Projects

Lower-emphasis exploratory and baseline work:

- --[Text Classification](https://github.com/joseosvaldo16/Internship_Projects/tree/main/Text_Classification)-- — Multi-class text classification using OpenAI embeddings + XGBoost vs deep learning; 75% accuracy on domain-specific issue descriptions
- --[Fake News Classifier](https://github.com/joseosvaldo16/Fake_News_Classifier_NLP)-- — Naive Bayes classifier implemented from scratch for binary NLP classification; useful as a baseline modeling reference
- --[PDF Data Extraction](https://github.com/joseosvaldo16/PDF_Data_Extaction)-- — Hybrid PDF parsing pipeline combining PDFMiner (text-based) and pytesseract (scanned/OCR), with GPT-4 for structured knowledge extraction

---

## Future Improvements

- Add monitoring and drift detection to deployed models
- Improve evaluation frameworks for LLM outputs (beyond accuracy/F1)
- Extend LLM systems to handle real-time streaming data
- Add end-to-end integration tests for SQL generation pipelines
- Explore fine-tuning smaller models as cost-efficient alternatives to GPT-4 for structured querying

---

## Contact

[LinkedIn](https://www.linkedin.com/in/jvera3/) — open to collaborations and inquiries.
