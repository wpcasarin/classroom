<footer>
  <div class="container">
    <article>
      <hgroup>
        <h2>Inscreva-se</h2>
        <h3>Litora torquent per conubia nostra</h3>
      </hgroup>
      <form>
        <div class="input-group">
          <input
            type="text"
            id="firstname"
            name="firstname"
            placeholder="Nome"
            aria-label="Nome"
            required />
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Email "
            aria-label="Email"
            required />
        </div>
        <button type="submit" on:click|preventDefault>Inscreva-se</button>
      </form>
    </article>
  </div>
</footer>

<style>
footer {
  background: var(--contrast);
  display: flex;
  justify-content: center;
  align-items: center;
}
article {
  margin: 0;
}

form {
  display: flex;
  gap: 1rem;
}

.input-group {
  display: flex;
  flex-grow: 1;
  gap: 1rem;
}

button {
  width: 330px;
}

@media (max-width: 768px) {
  .input-group {
    flex-direction: column;
  }
}
@media (max-width: 992px) {
  form {
    flex-direction: column;
  }
  button {
    width: 100%;
  }
}
</style>
