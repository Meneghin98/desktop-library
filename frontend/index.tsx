import { definePlugin, Field } from 'millennium';
import { DesktopView } from './desktop/DesktopView';

const DESKTOP_ROUTE = '/library/desktop';

/**
 * Extra entries for the Library dropdown in the top navigation bar.
 * Read by the patch in backend/main.lua (via #{{self}}), which spreads them
 * after "Collections". `route` makes Steam navigate there on click; names not
 * starting with "#" are shown as-is (not localized).
 *
 * @ffi
 */
export const libraryMenuItems = [{ name: 'Desktop', route: DESKTOP_ROUTE }];

/**
 * Component rendered by the library route injected by the patch in
 * backend/main.lua. The route path there must match DESKTOP_ROUTE.
 *
 * @ffi
 */
export const LibraryDesktopView = DesktopView;

const SettingsContent = () => {
	return <Field label="Desktop Library" description="Settings will be available here." />;
};

const PluginIcon = () => (
	<svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
		<rect x="1" y="1" width="6" height="6" rx="1" />
		<rect x="9" y="1" width="6" height="6" rx="1" />
		<rect x="1" y="9" width="6" height="6" rx="1" />
		<rect x="9" y="9" width="6" height="6" rx="1" />
	</svg>
);

export default definePlugin(() => {
	return {
		icon: <PluginIcon />,
		content: <SettingsContent />,
	};
});
