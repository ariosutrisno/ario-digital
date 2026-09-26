{{flutter_js}}
{{flutter_build_config}}

// Opt-in workaround for browsers that fail to compile CanvasKit GPU shaders.
const useCpuRendering = new URLSearchParams(window.location.search)
  .get('rendering') === 'cpu';

_flutter.loader.load({
  config: useCpuRendering
    ? { renderer: 'canvaskit', canvasKitForceCpuOnly: true }
    : {},
});
