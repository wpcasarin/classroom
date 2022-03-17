<article>
  <div class="avatar"></div>
  <p>Person name</p>
  <h2>Card title</h2>
</article>

<style lang="scss">
article {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding-block: 1rem;
  padding-inline: 0;
  width: 300px;
  h2 {
    margin: 0;
  }
}
.avatar {
  width: 100px;
  aspect-ratio: 1;
  border-radius: 50%;
  background: url(https://api.lorem.space/image/face?hash=92048);
  background-size: cover;
  background-repeat: no-repeat;
}

@media (max-width: 768px) {
  article {
    width: 100%;
  }
}
</style>
