import type { CSSProperties } from 'react';

/**
 * Fill the library content area. The parent (Steam's "AppDetailsMain") is a
 * vertical flex container sized to the area next to the games list.
 *
 * TODO: decide how to style the plugin UI. Today this component mixes `dl-` class
 * names (no CSS behind them yet) with inline styles, which themes can only override
 * with `!important` and which don't support :hover, selectors, animations or media queries.
 * - `import './file.css'` doesn't work: starlight's bundler (Rolldown) fails with
 *   "Bundling CSS is no longer supported"; importing as text (`with { type: 'text' }`,
 *   `?raw`) fails too.
 * - The plugin code runs in SharedJSContext but components render in other windows
 *   (e.g. the main Steam window), so a stylesheet must be injected into the component's
 *   `ownerDocument`, not the global `document`.
 * - Options: (a) CSS as a TS string + a hook that injects a <style> into `ownerDocument`
 *   (tried, works, but no editor CSS support); (b) a real .css file in resources/ read by
 *   the backend (`millennium.assets.read`) and injected by the frontend (editor support,
 *   but async: brief unstyled flash).
 */
const rootStyle: CSSProperties = {
	flex: '1 1 auto',
	minHeight: 0,
	position: 'relative',
	overflow: 'hidden',
};

/** The desktop page: for now an empty placeholder. */
export const DesktopView = () => {
	return (
		<div className="dl-desktop" style={rootStyle}>
			<h1 className="dl-desktop-title">Desktop</h1>
		</div>
	);
};
