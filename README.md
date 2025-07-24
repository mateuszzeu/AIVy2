<p align="center">
  <img width="800" height="800" alt="AIvy logo ostateczne biale" src="https://github.com/user-attachments/assets/9408fec0-3b00-41fc-8a0e-d76aa03bd67a" />
</p>


# Your Always-Available AI Chat for iOS

**AIvy** is a modern iOS app that lets you chat with a smart AI agent – for anything from life planning to finance and content creation. Every conversation is stored securely and always accessible. AIvy uses leading-edge tools, a robust SwiftUI architecture, and a highly flexible AI backend. Try it as your day-to-day assistant, creative partner, or personal analyst.

---

## ✨ Key Features

- **Persistent Chat:** Your entire conversation history is saved and instantly available.
- **Powerful AI Agent:** AIvy connects to a customizable AI agent via n8n webhook. The agent can:
  - Help with life and productivity questions
  - Generate documents or content on demand
  - Analyze markets or answer finance queries
  - ...and be extended to many other domains as needed
- **Modern UI:** Fast, lightweight, and built 100% in SwiftUI.
- **Easy Login & Registration:** Seamless authentication, user session handling, and onboarding.


---

## 🛠️ Tech Stack

| Tech / Service        | What’s it for                   |
|---------------------- |---------------------------------|
| ![Swift](https://img.shields.io/badge/Swift-FA7343?logo=swift&logoColor=white)      | Core app logic         |
| ![SwiftUI](https://img.shields.io/badge/SwiftUI-008080?logo=swift&logoColor=white)  | UI framework           |
| ![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?logo=supabase&logoColor=white) | User & chat storage    |
| ![n8n](https://img.shields.io/badge/n8n-1A1A1A?logo=n8n&logoColor=white)            | AI agent/webhook orchestration |
| ![OpenAI](https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=white)   | LLM backend    |
| ![SOLID](https://img.shields.io/badge/SOLID-Principles-007396?logo=appveyor)        | Clean code / MVVM+C     |

---

## 📱 Screenshots

<p float="left">
  <img width="332" height="720" alt="converted_1" src="https://github.com/user-attachments/assets/0580d281-880d-45be-906b-78c6ad3486c8" />
  <img width="332" height="720" alt="converted_2" src="https://github.com/user-attachments/assets/5a78b0be-797e-4ba8-99ba-7e5178e25600" />
</p>

<p float="left">
 <img width="332" height="720" alt="converted_3" src="https://github.com/user-attachments/assets/fa195e6e-2cb1-49e1-b4cf-c53f1be70cd1" />
 <img width="332" height="720" alt="converted_4" src="https://github.com/user-attachments/assets/e40c3a18-a097-4992-ab47-5b9cc6169b00" />
</p>


---

## 🧩 Architecture & Approach

- **MVVM + Coordinator** – Clear separation of concerns, easy to scale.
- **Modern Swift Concurrency** – All async code uses async/await.
- **Persistent, Real-Time Storage** – Every message is synced with Supabase, so you never lose context.
- **Composable AI Backend** – Swap, chain, or extend your AI agent as you wish, using n8n’s powerful automation and OpenAI models.
- **SOLID Principles** – Codebase is clean, testable, and ready for production-level extensions.

---

## 🚀 Example Use Cases

- Daily personal assistant  
- Smart document and report generator  
- Brainstorming & content ideation  
- Crypto & finance market analysis  
- Anything you can automate with LLMs – without limits

---

## 💡 Get Started

> **Clone, run, and chat with your own AI!**

1. `git clone https://github.com/youruser/AIvy.git`
2. Add your [Supabase](https://supabase.com) keys.
3. Set your webhook for the n8n AI agent.
4. `Run` in Xcode and enjoy 🚀

---

*AIvy is designed to be extended: plug in smarter models, automate your workflows, or integrate with other APIs as you grow.*
