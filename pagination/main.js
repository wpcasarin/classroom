'use strict';

import './style.css';

const getData = async (url) => {
  const response = await fetch(url);
  if (response.status === 200) {
    const data = await response.json();
    return data;
  }
};

const appendItem = (item) => {
  const row = document.createElement('tr');
  const name = document.createElement('td');
  const job = document.createElement('td');
  const email = document.createElement('td');
  name.textContent = item.name;
  job.textContent = item.job;
  email.textContent = item.email;
  row.appendChild(name);
  row.appendChild(job);
  row.appendChild(email);
  list.appendChild(row);
};

const updateContent = (index) => {
  list.innerHTML = '';
  list.innerHTML = `
  <tr>
    <th>Nome</th>
    <th>Profissão</th>
    <th>E-mail</th>
  </tr>
`;
  for (let i = index; i < index + 5; i++) {
    appendItem(data[i]);
    dataIndex = i;
  }
};

const updatePageIndex = (page, size) => {
  current.textContent = `${page} - ${size / 5}`;
};

const nextPage = () => {
  if (currentPage != dataSize / 5) {
    updateContent(dataIndex);
    dataIndex++;
    currentPage++;
    updatePageIndex(currentPage, dataSize);
  }
};

const prevPage = () => {
  if (dataIndex > 5) {
    updateContent(dataIndex - 10);
    dataIndex++;
    currentPage--;
  }
  updatePageIndex(currentPage, dataSize);
};

const prev = document.querySelector('.prev');
const next = document.querySelector('.next');
const current = document.querySelector('.current');
const list = document.querySelector('.list');
const url = 'http://127.0.0.1:8000/api';
const dataJson = await getData(url);
const data = dataJson.objects;
const dataSize = Object.keys(data).length;
let dataIndex = 0;
let currentPage = 0;

next.addEventListener('click', nextPage);

prev.addEventListener('click', prevPage);

window.addEventListener('DOMContentLoaded', nextPage());
