<script>
export let text = 'link';
</script>

<li><a href="#">{text}</a></li>

<style lang="scss">
$hover: hsl(195, 85%, 21%);
a {
  padding: 0;
  text-transform: uppercase;
  font-weight: bold;
  color: var(--primary-inverse);
  &:hover {
    color: $hover;
  }
}
li {
  padding-block: 0;
}
</style>
