# Teleport-DoubleJump-Free-RDV

**Teleport-DoubleJump-Free-RDV** là một hệ thống **movement mechanics** đơn giản dành cho game trong Roblox.
Project này cung cấp **Teleport (Blink)** và **Double Jump** giúp nhân vật di chuyển linh hoạt hơn trong game.

Đây là **bản miễn phí (Free Edition)** được chia sẻ bởi cộng đồng **Roblox Dev Vietnam (RDV)** nhằm hỗ trợ các developer mới học lập trình Roblox.

---

# Tính năng

## 1. Teleport System

Cho phép người chơi **dịch chuyển tức thời tới vị trí con trỏ chuột**.

**Phím kích hoạt:**
`T`

Ứng dụng trong:

* Game PvP
* Game combat
* Game adventure
* Game parkour

---

## 2. Double Jump System

Cho phép người chơi **nhảy hai lần khi đang ở trên không**.

**Phím kích hoạt:**
`Space` (nhấn 2 lần)

Ứng dụng trong:

* Game parkour
* Game platform
* Game movement-based combat

---

# Các phiên bản trong project

Project bao gồm **2 phiên bản script** cho mỗi hệ thống.

---

# 1. Teleport System

## Teleport - Bản thường

Chức năng:

* Nhấn **T** để teleport tới vị trí chuột.
* Không có giới hạn khoảng cách.
* Không có cooldown.

Phù hợp cho:

* Test mechanics
* Prototype game
* Game đơn giản

---

## Teleport - Bản nâng cấp

Chức năng bổ sung:

* **Cooldown teleport**
* **Giới hạn khoảng cách teleport**
* Chống spam skill

Ví dụ cấu hình:

```lua
maxDistance = 120
cooldownTime = 2
```

Phù hợp cho:

* Game PvP
* Game combat
* Game multiplayer

---

# 2. Double Jump System

## Double Jump - Bản thường

Chức năng:

* Cho phép nhảy **2 lần liên tiếp**.
* Reset khi nhân vật chạm đất.

Hoạt động:

```
Space → Jump
Space lần 2 → Double Jump
```

Phù hợp cho:

* Game platform
* Game parkour

---

## Double Jump - Bản nâng cấp

Chức năng bổ sung:

* **Boost lực nhảy lần 2**
* Jump cao hơn
* Movement mượt hơn

Ví dụ cấu hình:

```lua
boostPower = 60
```

Phù hợp cho:

* Game combat
* Game movement skill
* Game PvP

---

# Cách cài đặt

## Bước 1

Mở project trong Roblox Studio.

## Bước 2

Đi tới thư mục:

```
StarterPlayer
 └ StarterPlayerScripts
```

## Bước 3

Thêm các **LocalScript**:

```
Teleport_Normal
Teleport_Advanced
DoubleJump_Normal
DoubleJump_Advanced
```

## Bước 4

Chọn **một phiên bản** bạn muốn dùng.

Ví dụ:

Nếu muốn dùng bản nâng cấp:

```
Teleport_Advanced
DoubleJump_Advanced
```

Không cần dùng cả hai phiên bản cùng lúc.

---

# Cách kích hoạt trong game

## Teleport

1. Di chuyển chuột tới vị trí muốn tới
2. Nhấn **T**
3. Nhân vật sẽ dịch chuyển tới vị trí đó

---

## Double Jump

1. Nhấn **Space** để nhảy
2. Khi đang trên không nhấn **Space lần nữa**
3. Nhân vật sẽ **nhảy lần 2**

---

# Lưu ý

* Các script này là **LocalScript** nên chỉ hoạt động ở client.
* Nên đặt trong:

```
StarterPlayerScripts
```

* Bạn có thể chỉnh sửa các thông số như:

  * Khoảng cách teleport
  * Thời gian cooldown
  * Lực nhảy double jump

---

# Mục đích project

Project này được tạo ra để:

* Giúp developer mới học Roblox scripting
* Cung cấp resource miễn phí
* Làm ví dụ cho hệ thống **movement mechanics**

---

# Giấy phép

Bạn có thể:

✔ Sử dụng trong game của mình
✔ Chỉnh sửa source code
✔ Học và phát triển thêm

Bạn **không nên bán lại nguyên project này** khi chưa chỉnh sửa đáng kể.

**Project:** Teleport-DoubleJump-Free-RDV
**Author:** Roblox Dev Vietnam
**Version:** Free Edition
