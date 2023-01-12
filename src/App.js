import React from 'react';
import logo from './gitlab.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <a
          className="App-link"
          href="https://gitlab.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          Testing My Robin, 02 Januari 2023, 10:43
        </a>
      </header>
    </div>
  );
}

export default App;
