<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Glow Up RPG Dashboard</title>
  <style>
    /* --- Reset & Font --- */
    * {margin:0; padding:0; box-sizing:border-box; font-family: 'Poppins', sans-serif;}
    body {
      background: #1e1e2f;
      color: #f8f0f8;
      display: flex;
      flex-direction: column;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    /* --- Header --- */
    h1 {
      margin-bottom: 20px;
      color: #ffb6c1;
      text-align: center;
      font-size: 2rem;
    }

    /* --- Avatar --- */
    .avatar-container {
      position: relative;
      width: 150px;
      height: 150px;
      margin-bottom: 20px;
    }
    .avatar-container img {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      border: 4px solid #ffb6c1;
      object-fit: cover;
    }

    /* --- XP Bar --- */
    .xp-bar-container {
      width: 80%;
      background: #33334d;
      border-radius: 25px;
      overflow: hidden;
      margin-bottom: 30px;
      height: 25px;
    }
    .xp-bar {
      height: 100%;
      width: 0%;
      background: linear-gradient(90deg, #ff9acc, #ffb6c1);
      border-radius: 25px;
      transition: width 0.5s ease;
    }
    .xp-text {
      text-align: center;
      margin-top: 5px;
      font-weight: 500;
      color: #ffb6c1;
    }

    /* --- Daily Quests --- */
    .quests {
      width: 80%;
      margin-bottom: 30px;
    }
    .quests h2 {
      margin-bottom: 10px;
      color: #ffb6c1;
    }
    .quest-item {
      display: flex;
      justify-content: space-between;
      background: #2b2b42;
      padding: 10px 15px;
      border-radius: 12px;
      margin-bottom: 10px;
      align-items: center;
      transition: 0.3s;
    }
    .quest-item.completed {
      opacity: 0.6;
      text-decoration: line-through;
    }
    .quest-item button {
      background: #ff9acc;
      border: none;
      padding: 5px 10px;
      border-radius: 8px;
      cursor: pointer;
      color: #1e1e2f;
      font-weight: 600;
    }

    /* --- Upgrade Button --- */
    .upgrade-btn {
      background: #ffb6c1;
      color: #1e1e2f;
      border: none;
      padding: 12px 25px;
      border-radius: 20px;
      font-weight: 600;
      cursor: pointer;
      margin-bottom: 20px;
      transition: 0.3s;
    }
    .upgrade-btn:hover {
      background: #ff9acc;
    }

    /* --- Pricing Table --- */
    .pricing-table {
      display: none;
      width: 80%;
      background: #2b2b42;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
    }
    .pricing-table h3 {
      text-align: center;
      margin-bottom: 15px;
      color: #ffb6c1;
    }
    .pricing-table table {
      width: 100%;
      border-collapse: collapse;
    }
    .pricing-table th, .pricing-table td {
      padding: 12px;
      border: 1px solid #444466;
      text-align: center;
    }
    .pricing-table th {
      background: #33334d;
      color: #ffb6c1;
    }
    .pricing-table td {
      color: #f8f0f8;
    }

  </style>
</head>
<body>

  <h1>Glow Up RPG Dashboard</h1>

  <!-- Avatar -->
  <div class="avatar-container">
    <img src="https://i.pravatar.cc/150?img=32" alt="Avatar">
  </div>

  <!-- XP Bar -->
  <div class="xp-bar-container">
    <div class="xp-bar" id="xpBar"></div>
  </div>
  <div class="xp-text" id="xpText">XP: 0 / 100</div>

  <!-- Daily Quests -->
  <div class="quests">
    <h2>Daily Quests</h2>
    <div class="quest-item">
      <span>Skincare Routine</span>
      <button onclick="completeQuest(this, 20)">Complete</button>
    </div>
    <div class="quest-item">
      <span>Drink 2L Water</span>
      <button onclick="completeQuest(this, 15)">Complete</button>
    </div>
    <div class="quest-item">
      <span>Morning Stretch</span>
      <button onclick="completeQuest(this, 10)">Complete</button>
    </div>
  </div>

  <!-- Upgrade Button -->
  <button class="upgrade-btn" onclick="togglePricing()">Upgrade to Premium</button>

  <!-- Pricing Table -->
  <div class="pricing-table" id="pricingTable">
    <h3>Premium Pricing</h3>
    <table>
      <tr>
        <th>Plan</th>
        <th>Price</th>
        <th>Benefits</th>
      </tr>
      <tr>
        <td>Monthly</td>
        <td>$9.99</td>
        <td>Unlimited Quests, Exclusive Skins</td>
      </tr>
      <tr>
        <td>Yearly</td>
        <td>$99.99</td>
        <td>All Monthly Benefits + Bonus XP</td>
      </tr>
    </table>
  </div>

  <script>
    let xp = 0;
    const xpBar = document.getElementById('xpBar');
    const xpText = document.getElementById('xpText');

    function updateXP(amount) {
      xp += amount;
      if(xp > 100) xp = 100;
      xpBar.style.width = xp + '%';
      xpText.textContent = `XP: ${xp} / 100`;
    }

    function completeQuest(button, xpAmount) {
      const questItem = button.parentElement;
      if(!questItem.classList.contains('completed')) {
        questItem.classList.add('completed');
        updateXP(xpAmount);
      }
    }

    function togglePricing() {
      const table = document.getElementById('pricingTable');
      table.style.display = table.style.display === 'none' ? 'block' : 'none';
    }
  </script>

</body>
</html>
