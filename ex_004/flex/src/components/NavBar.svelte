<script>
import NavBarLink from './NavBarLink.svelte';
import NavBarLogo from './NavBarLogo.svelte';
</script>

<header>
  <nav class="container">
    <ul><NavBarLogo /></ul>
    <ul class="nav-list">
      <NavBarLink text="capa" />
      <NavBarLink text="brasil" />
      <NavBarLink text="américa latina" />
      <NavBarLink text="mundo" />
      <NavBarLink text="economia" />
      <NavBarLink text="cultura" />
    </ul>
  </nav>
</header>

<style>
header {
  padding-block: 1.5rem;
  background: var(--primary);
}
nav {
  flex-direction: column;
}
.nav-list {
  display: flex;
  gap: 2rem;
}

@media (max-width: 768px) {
  .nav-list {
    flex-direction: column;
    align-items: flex-start;
  }
}
</style>
