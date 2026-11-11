import { definePlugin, Field } from 'millennium';

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
	console.log('Desktop Library frontend initialized');

	return {
		icon: <PluginIcon />,
		content: <SettingsContent />,
	};
});
