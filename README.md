# 📱 WhatsApp Clone

A full-stack WhatsApp Clone built using Flutter for the frontend and Node.js + MongoDB for the backend, featuring Firebase for OTP-based authentication and Hive for local storage. The app supports real-time messaging, user authentication, profile setup, and more.

---

## 🔧 Tech Stack

### 🚀 Frontend (Flutter)
- Flutter (BLoC pattern + Clean Architecture)
- Firebase Auth (Phone number verification)
- Hive (Local NoSQL DB for fast storage and caching)
- REST API integration

### 🛠 Backend (Node.js)
- Node.js + Express
- MongoDB (with Mongoose)
- Firebase Admin SDK (for token verification)

---

## ✅ Features

### 🔐 Authentication
- Firebase phone number login
- Token-based auth verification (JWT or Firebase ID Token)

### 👤 User
- Set profile name and photo
- Get current user info
- List of contacts

### 💬 Messaging
- Send and receive messages
- One-to-one chat
- Real-time message updates (planned via sockets)

### 🌙 UI/UX
- WhatsApp-like theme
- Light & Dark mode
- Responsive for mobile

---

# 🗺️ Project Roadmap: WhatsApp Clone


## ✅ Completed

- [x] Project Initialization
  - Flutter frontend with Clean Architecture and BLoC
  - Node.js backend setup with Express and MongoDB
- [x] Firebase Integration
  - Firebase Auth (Phone Number OTP)
  - Firebase Admin SDK for token verification in backend
- [x] Authentication Flow
  - Phone login
  - Token exchange with backend
  - Secure routes using middleware
- [x] User Management
  - Create/update user
  - Fetch user profile
- [x] Messaging System
  - Send/receive messages
  - Store messages in MongoDB
- [x] Basic UI Screens
  - Login and OTP verification
  - Chat list
  - Chat screen
  - Profile setup

---

## 🚧 In Progress

- [ ] UI Polishing
  - WhatsApp-style chat bubbles
  - AppBar and avatars
- [ ] Chat Features
  - Message timestamps
  - Read/unread status
- [ ] Contact Integration
  - Fetch contacts from device
  - Match with existing users

---

## 🧩 Upcoming Features

### 🔔 Notifications
- [ ] Push notifications using Firebase Cloud Messaging

### 🔁 Real-Time Communication
- [ ] WebSocket integration for real-time messaging
- [ ] Typing indicators
- [ ] Online/offline status

### 🖼️ Media Support
- [ ] Send/receive images and videos
- [ ] Image/video preview

### 👥 Group Chats
- [ ] Group creation and management
- [ ] Group messages and member roles

### 🧰 Advanced Settings
- [ ] Delete message
- [ ] Message reply/forward
- [ ] Archived chats

---

## 🔮 Future Enhancements

- [ ] Voice/video call (using WebRTC or Twilio)
- [ ] End-to-End Encryption
- [ ] Chat backup and restore
- [ ] Multi-device support

---


## 🙋 Contributions

We welcome ideas, suggestions, and pull requests. Please open an issue or submit a PR if you’d like to contribute.

---

