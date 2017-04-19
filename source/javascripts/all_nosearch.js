//= require ./lib/_energize
//= require ./app/_toc
//= require ./app/_lang

setTimeout(function() {
  loadToc($('#toc'), '.toc-link', '.toc-list-h2, .toc-list-h3', 10);
  setupLanguages($('body').data('languages'));
  $('.content').imagesLoaded( function() {
    window.recacheHeights();
    window.refreshToc();
  });
}, 3000);

window.onpopstate = function() {
  activateLanguage(getLanguageFromQueryString());
};
