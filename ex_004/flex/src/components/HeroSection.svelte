<section class="hero">
  <h1 class="container">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. In, sapiente.
  </h1>
</section>

<style>
.hero {
  height: 400px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(
      0deg,
      rgba(0, 0, 0, 1) 0%,
      rgba(255, 255, 255, 0) 100%
    ),
    url('../assets/hero.jpg');
}
h1 {
  margin-top: auto;
  font-size: 2.2rem;
  color: var(--primary-inverse);
  text-align: center;
}

@media (max-width: 768px) {
  h1 {
    font-size: 1.8rem;
  }
}
</style>
