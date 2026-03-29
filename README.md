# Jose Vera — Machine Learning Engineer

Focus areas:
- Production ML systems and deployment
- LLM-based applications (RAG, agents, structured querying)
- Data-driven decision systems (time series, anomaly detection)

---

## Project Navigation

| Project | Area | Focus |
|---|---|---|
| [SalesBooking Chatbot](#1-salesbooking-chatbot--azure--llm) | LLM / Systems | NL → SQL, Azure deployment, multi-channel |
| [SQL Chatbot](#2-sql-chatbot-with-llm) | LLM | NL → SQL, schema grounding, query generation |
| [Battery Decision System](#3-battery-decision-system-tabnet) | ML | TabNet vs XGBoost, class imbalance, feature engineering |
| [ONNX Deployment](#4-model-deployment-with-onnx) | Systems | Framework-agnostic inference, model optimization |
| [Text Classification](#additional-projects) | NLP | Embedding-based classification, multi-class |
| [Fake News Classifier](#additional-projects) | NLP | Baseline NLP modeling, Naive Bayes from scratch |
| [PDF Data Extraction](#additional-projects) | Data Engineering | Hybrid PDF parsing (text + OCR), LLM structuring |

---

## Featured Projects

### 1. SalesBooking Chatbot — Azure + LLM

**Problem:** Automate sales booking workflows by enabling natural language interaction with a structured SQL database, deployed at scale across enterprise channels.

**Why it matters:** Bridges the gap between non-technical users and production databases, reducing query latency and manual data entry in sales operations.

**Key technical components:**
- LLM-based NL → SQL pipeline with table selection and keyword correction
- Multi-step GPT-4 prompting for schema grounding and result formatting
- Deployment via Azure Bot Services and Azure App Services (multi-channel)
- Average query-to-response latency: ~5 seconds on production data

**Repo:** [SalesBooking-Chatbot-App](https://github.com/joseosvaldo16/SalesBookingChatBot)

---

### 2. SQL Chatbot with LLM

**Problem:** Enable natural language querying over SQL databases with high column cardinality and large numbers of tables, where direct schema lookup is impractical.

**Why it matters:** Demonstrates LLM system design beyond simple prompt chaining — the architecture handles schema grounding, ambiguity resolution, and multi-step reasoning.

**Key technical components:**
- Multi-step GPT-4 pipeline: table selection → keyword correction → SQL generation
- Schema-aware prompting to handle large, ambiguous databases
- Modular design separating query understanding, generation, and execution
- Built with LangChain and sqlite3

**Repo:** [SQL-Chatbot](https://github.com/joseosvaldo16/SQL-ChatBot)

---

### 3. Battery Decision System (TabNet)

**Problem:** Classify battery state under domain-specific constraints and evaluate whether a more expressive architecture (TabNet) outperforms an existing XGBoost baseline on imbalanced data.

**Why it matters:** Real-world classification problems often involve class imbalance and domain constraints that make standard accuracy metrics misleading — this project addresses both.

**Key technical components:**
- TabNet vs XGBoost comparison under class imbalance conditions
- Feature engineering tailored to battery domain characteristics
- Evaluation focused on F1-score rather than raw accuracy
- Analysis of model behavior under dataset constraints

**Repo:** [Battery Decision](https://github.com/joseosvaldo16/Internship_Projects/tree/main/Battery_Decision)

---

### 4. Model Deployment with ONNX

**Problem:** Deploy a PyTorch-trained model for inference in a framework-agnostic runtime, decoupling training from serving.

**Why it matters:** Demonstrates understanding of the training-inference boundary — a key concern in production ML systems.

**Key technical components:**
- PyTorch → ONNX export pipeline
- ONNX Runtime inference setup
- Separation of training and inference environments
- Cross-framework compatibility verification

**Repo:** [Deploying_With_ONNX](https://github.com/joseosvaldo16/Deploying_With_ONNX)

---

## Engineering Capabilities Demonstrated

- **LLM system design** — multi-step prompting, schema grounding, structured outputs, retrieval
- **Model deployment** — ONNX export, API-based serving, Azure cloud deployment
- **Data pipelines and feature engineering** — structured and unstructured data (SQL, PDF, text)
- **Model evaluation and error analysis** — F1-score, class imbalance handling, baseline comparison
- **Containerization and cloud** — Azure Bot Services, Azure App Services, Docker-ready setups

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

- **Latency vs accuracy** — multi-step LLM pipelines improve accuracy at the cost of latency; the SalesBooking chatbot targets ~5s end-to-end
- **Model complexity vs interpretability** — TabNet chosen over deep networks for structured tabular data where feature attribution matters
- **LLM cost vs quality** — multi-step GPT-4 calls increase cost but reduce hallucinated SQL; schema grounding reduces invalid query rates
- **Handling class imbalance** — battery classification evaluated on F1-score rather than accuracy to avoid misleading results on skewed distributions
- **Framework lock-in** — ONNX deployment explicitly targets cross-framework portability over single-framework optimization

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

- **[Text Classification](https://github.com/joseosvaldo16/Internship_Projects/tree/main/Text_Classification)** — Multi-class text classification using OpenAI embeddings + XGBoost vs deep learning; 75% accuracy on domain-specific issue descriptions
- **[Fake News Classifier](https://github.com/joseosvaldo16/Fake_News_Classifier_NLP)** — Naive Bayes classifier implemented from scratch for binary NLP classification; useful as a baseline modeling reference
- **[PDF Data Extraction](https://github.com/joseosvaldo16/PDF_Data_Extaction)** — Hybrid PDF parsing pipeline combining PDFMiner (text-based) and pytesseract (scanned/OCR), with GPT-4 for structured knowledge extraction

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

