{config, pkgs, modulesPath, ... }:

{

home.packages = [
  pkgs.equibop
];

home.file."/home/user/.config/equibop/themes/kydark.css".text = ''
/**
 * @name kydark (midnight fork)
 * @description A darkened discord theme.
 * @author Hanako (refact0r created the original project)
 * @version 1.6.2
*/

/* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

@import url('https://refact0r.github.io/midnight-discord/midnight.css');
@import url(https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css?family=Comfortaa:300,400,500,600,700&display=swap');

body {
  font-family: 'Comfortaa', Arial, cursive;
}

/* customize things here */
:root {
	/* font, change to 'gg sans' for default discord font*/
	--corner-text: 'KyDark';

	/* color of status indicators and window controls */
	--online-indicator: var(--accent-2); /* change to #23a55a for default green */
	--dnd-indicator: hsl(340, 60%, 60%); /* change to #f13f43 for default red */
	--idle-indicator: hsl(50, 60%, 60%); /* change to #f0b232 for default yellow */

	/* accent colors */
	--accent-1: hsl(0, 0%, 42%); /* links */
	--accent-2: hsl(0, 0%, 33%); /* general unread/mention elements */
	--accent-3: hsl(0, 0%, 31%); /* accent buttons */
	--accent-4: hsl(0, 0%, 26%); /* accent buttons when hovered */
	--accent-5: hsl(0, 0%, 20%); /* accent buttons when clicked */
	--mention: hsla(0, 0%, 13%, 0.1); /* mentions & mention messages */
	--mention-hover: hsla(190, 80%, 52%, 0.05); /* mentions & mention messages when hovered */

	/* text colors */
	--text-0: white; /* text on colored elements */
	--text-1: var(--text-2); /* other normally white text */
	--text-2: hsl(220, 25%, 70%); /* headings and important text */
	--text-3: hsl(220, 15%, 60%); /* normal text */
	--text-4: hsl(220, 15%, 40%); /* icon buttons and channels */
	--text-5: hsl(220, 15%, 25%); /* muted channels/chats and timestamps */

	/* background and dark colors */
	--bg-1: hsl(0, 0%, 5%); /* dark buttons when clicked */
	--bg-2: hsl(0, 0%, 5%); /* dark buttons */
	--bg-3: hsl(0, 0%, 5%); /* spacing, secondary elements */
	--bg-4: hsl(0, 0%, 5%); /* main background color */
	--hover: hsla(230, 20%, 40%, 0.1); /* channels and buttons when hovered */
	--active: hsla(220, 20%, 40%, 0.2); /* channels and buttons when clicked or selected */
	--message-hover: hsla(220, 0%, 0%, 0.1); /* messages when hovered */

	/* amount of spacing and padding */
	--spacing: 12px;

	/* animations */
	--hover-push: 0.2s ease; /* channels/members when hovered */

	/* corner roundness (border-radius) */
	--roundness-xl: 22px; /* roundness of big panel outer corners */
	--roundness-l: 20px; /* popout panels */
	--roundness-m: 16px; /* smaller panels, images, embeds */
	--roundness-s: 12px; /* members, settings inputs */
	--roundness-xs: 10px; /* channels, buttons */
	--roundness-xxs: 8px; /* searchbar, small elements */

	/* direct messages moon icon */
	/* change to block to show, none to hide */
	--discord-icon: none; /* discord icon */
	--moon-icon: block; /* moon icon */
	--moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
	--moon-icon-size: auto;

	/* filter uncolorable elements to fit theme */
	/* (just set to none, they're too much work to configure) */
	--login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4); /* login background artwork */
	--green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43); /* add friend page explore icon */
	--blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2); /* add friend page school icon */
}
'';

home.file."/home/user/.config/equibop/settings/settings.json".text = '' 
{
    "notifyAboutUpdates": true,
    "autoUpdate": false,
    "autoUpdateNotification": true,
    "useQuickCss": true,
    "themeLinks": [],
    "enabledThemes": [
        "kydark.css"
    ],
    "enableReactDevtools": false,
    "frameless": false,
    "transparent": false,
    "winCtrlQ": false,
    "disableMinSize": false,
    "winNativeTitleBar": false,
    "plugins": {
        "BadgeAPI": {
            "enabled": true
        },
        "CommandsAPI": {
            "enabled": true
        },
        "ContextMenuAPI": {
            "enabled": true
        },
        "MemberListDecoratorsAPI": {
            "enabled": true
        },
        "MessageAccessoriesAPI": {
            "enabled": true
        },
        "MessageDecorationsAPI": {
            "enabled": true
        },
        "MessageEventsAPI": {
            "enabled": true
        },
        "MessagePopoverAPI": {
            "enabled": true
        },
        "NoticesAPI": {
            "enabled": true
        },
        "ServerListAPI": {
            "enabled": true
        },
        "NoTrack": {
            "enabled": true,
            "disableAnalytics": true
        },
        "Settings": {
            "enabled": true,
            "settingsLocation": "aboveActivity"
        },
        "SupportHelper": {
            "enabled": true
        },
        "AlwaysAnimate": {
            "enabled": true
        },
        "AlwaysTrust": {
            "enabled": true,
            "domain": true,
            "file": true
        },
        "AnonymiseFileNames": {
            "enabled": true,
            "anonymiseByDefault": true,
            "method": 0,
            "randomisedLength": 7
        },
        "BANger": {
            "enabled": true
        },
        "BetterFolders": {
            "enabled": false,
            "sidebar": true,
            "showFolderIcon": 1,
            "closeAllHomeButton": false,
            "keepIcons": false,
            "sidebarAnim": true,
            "closeAllFolders": false,
            "forceOpen": false,
            "closeOthers": false
        },
        "BetterGifAltText": {
            "enabled": false
        },
        "BetterGifPicker": {
            "enabled": false
        },
        "BetterNotesBox": {
            "enabled": false
        },
        "BetterRoleDot": {
            "enabled": true,
            "bothStyles": false,
            "copyRoleColorInProfilePopout": false
        },
        "BetterUploadButton": {
            "enabled": true
        },
        "BiggerStreamPreview": {
            "enabled": true
        },
        "BlurNSFW": {
            "enabled": false
        },
        "CallTimer": {
            "enabled": true,
            "format": "stopwatch"
        },
        "ClearURLs": {
            "enabled": false
        },
        "ClientTheme": {
            "enabled": false
        },
        "ColorSighted": {
            "enabled": false
        },
        "ConsoleShortcuts": {
            "enabled": false
        },
        "CopyUserURLs": {
            "enabled": false
        },
        "CrashHandler": {
            "enabled": true
        },
        "CustomRPC": {
            "enabled": false
        },
        "Dearrow": {
            "enabled": false
        },
        "Decor": {
            "enabled": false
        },
        "EmoteCloner": {
            "enabled": true
        },
        "Experiments": {
            "enabled": false
        },
        "F8Break": {
            "enabled": false
        },
        "FakeNitro": {
            "enabled": true,
            "enableEmojiBypass": true,
            "enableStickerBypass": true,
            "enableStreamQualityBypass": true,
            "transformStickers": true,
            "transformEmojis": true,
            "transformCompoundSentence": false
        },
        "FakeProfileThemes": {
            "enabled": true,
            "nitroFirst": true
        },
        "FavoriteEmojiFirst": {
            "enabled": true
        },
        "FavoriteGifSearch": {
            "enabled": false
        },
        "FixCodeblockGap": {
            "enabled": false
        },
        "FixSpotifyEmbeds": {
            "enabled": false
        },
        "FixYoutubeEmbeds": {
            "enabled": false
        },
        "ForceOwnerCrown": {
            "enabled": true
        },
        "FriendInvites": {
            "enabled": false
        },
        "GameActivityToggle": {
            "enabled": true,
            "oldIcon": false
        },
        "GifPaste": {
            "enabled": true
        },
        "GreetStickerPicker": {
            "enabled": false
        },
        "HideAttachments": {
            "enabled": true
        },
        "IgnoreActivities": {
            "enabled": true,
            "ignoredActivities": [],
            "ignoreListening": false
        },
        "ImageZoom": {
            "enabled": true,
            "size": 100,
            "zoom": 2,
            "nearestNeighbour": false,
            "square": false,
            "saveZoomValues": true
        },
        "InvisibleChat": {
            "enabled": false
        },
        "KeepCurrentChannel": {
            "enabled": false
        },
        "LastFMRichPresence": {
            "enabled": false
        },
        "LoadingQuotes": {
            "enabled": true,
            "replaceEvents": true,
            "enableDiscordPresetQuotes": false,
            "additionalQuotes": "",
            "additionalQuotesDelimiter": "|",
            "enablePluginPresetQuotes": true
        },
        "MemberCount": {
            "enabled": true,
            "memberList": true,
            "toolTip": true
        },
        "MessageClickActions": {
            "enabled": true
        },
        "MessageLinkEmbeds": {
            "enabled": true
        },
        "MessageLogger": {
            "enabled": true,
            "deleteStyle": "text",
            "ignoreBots": false,
            "ignoreSelf": false,
            "ignoreUsers": "",
            "ignoreChannels": "",
            "ignoreGuilds": "",
            "collapseDeleted": false,
            "logEdits": true,
            "logDeletes": true
        },
        "MessageTags": {
            "enabled": false
        },
        "MoreCommands": {
            "enabled": false
        },
        "MoreKaomoji": {
            "enabled": false
        },
        "MoreUserTags": {
            "enabled": true,
            "tagSettings": {
                "WEBHOOK": {
                    "text": "Webhook",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "OWNER": {
                    "text": "Owner",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "ADMINISTRATOR": {
                    "text": "Admin",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "MODERATOR_STAFF": {
                    "text": "Staff",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "MODERATOR": {
                    "text": "Mod",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "VOICE_MODERATOR": {
                    "text": "VC Mod",
                    "showInChat": true,
                    "showInNotChat": true
                },
                "CHAT_MODERATOR": {
                    "text": "Chat Mod",
                    "showInChat": true,
                    "showInNotChat": true
                }
            }
        },
        "Moyai": {
            "enabled": false
        },
        "MutualGroupDMs": {
            "enabled": false
        },
        "NoBlockedMessages": {
            "enabled": false
        },
        "NoDevtoolsWarning": {
            "enabled": false
        },
        "NoF1": {
            "enabled": true
        },
        "NoMosaic": {
            "enabled": false
        },
        "NoPendingCount": {
            "enabled": false
        },
        "NoProfileThemes": {
            "enabled": false
        },
        "NoRPC": {
            "enabled": false
        },
        "NoReplyMention": {
            "enabled": false
        },
        "NoScreensharePreview": {
            "enabled": true
        },
        "NoSystemBadge": {
            "enabled": false
        },
        "NoTypingAnimation": {
            "enabled": false
        },
        "NoUnblockToJump": {
            "enabled": false
        },
        "NormalizeMessageLinks": {
            "enabled": false
        },
        "NotificationVolume": {
            "enabled": false
        },
        "NSFWGateBypass": {
            "enabled": true
        },
        "OnePingPerDM": {
            "enabled": false
        },
        "OpenInApp": {
            "enabled": true,
            "spotify": true,
            "steam": true,
            "epic": true
        },
        "PermissionFreeWill": {
            "enabled": false
        },
        "PermissionsViewer": {
            "enabled": true,
            "permissionsSortOrder": 0,
            "defaultPermissionsDropdownState": false
        },
        "petpet": {
            "enabled": true
        },
        "PictureInPicture": {
            "enabled": false
        },
        "PinDMs": {
            "enabled": true,
            "dmSectioncollapsed": false,
            "pinOrder": 0
        },
        "PlainFolderIcon": {
            "enabled": true
        },
        "PlatformIndicators": {
            "enabled": true,
            "colorMobileIndicator": true,
            "list": true,
            "badges": true,
            "messages": true,
            "VencordConsoleIcon": false
        },
        "PreviewMessage": {
            "enabled": false
        },
        "QuickMention": {
            "enabled": true
        },
        "QuickReply": {
            "enabled": true
        },
        "ReactErrorDecoder": {
            "enabled": false
        },
        "ReadAllNotificationsButton": {
            "enabled": true
        },
        "RelationshipNotifier": {
            "enabled": false
        },
        "RevealAllSpoilers": {
            "enabled": true
        },
        "ReverseImageSearch": {
            "enabled": false
        },
        "ReviewDB": {
            "enabled": false
        },
        "RoleColorEverywhere": {
            "enabled": false
        },
        "SecretRingToneEnabler": {
            "enabled": true,
            "onlySnow": false
        },
        "SendTimestamps": {
            "enabled": false
        },
        "ServerListIndicators": {
            "enabled": false
        },
        "ShikiCodeblocks": {
            "enabled": false
        },
        "ShowAllMessageButtons": {
            "enabled": false
        },
        "ShowConnections": {
            "enabled": true,
            "iconSpacing": 1,
            "iconSize": 32
        },
        "ShowHiddenChannels": {
            "enabled": true,
            "showMode": 0,
            "hideUnreads": true,
            "defaultAllowedUsersAndRolesDropdownState": true
        },
        "ShowMeYourName": {
            "enabled": false
        },
        "SilentMessageToggle": {
            "enabled": false
        },
        "SilentTyping": {
            "enabled": false
        },
        "SortFriendRequests": {
            "enabled": false
        },
        "SpotifyControls": {
            "enabled": true,
            "hoverControls": false
        },
        "SpotifyCrack": {
            "enabled": true,
            "noSpotifyAutoPause": true,
            "keepSpotifyActivityOnIdle": false
        },
        "SpotifyShareCommands": {
            "enabled": true
        },
        "StartupTimings": {
            "enabled": false
        },
        "SuperReactionTweaks": {
            "enabled": false
        },
        "TextReplace": {
            "enabled": false
        },
        "ThemeAttributes": {
            "enabled": false
        },
        "TimeBarAllActivities": {
            "enabled": false
        },
        "Translate": {
            "enabled": true,
            "autoTranslate": false,
            "receivedInput": "auto",
            "receivedOutput": "it",
            "sentInput": "auto",
            "sentOutput": "ro",
            "showChatBarButton": true
        },
        "TypingIndicator": {
            "enabled": false
        },
        "TypingTweaks": {
            "enabled": true,
            "alternativeFormatting": true,
            "showRoleColors": true,
            "showAvatars": true
        },
        "Unindent": {
            "enabled": false
        },
        "UnsuppressEmbeds": {
            "enabled": false
        },
        "UrbanDictionary": {
            "enabled": false
        },
        "UserVoiceShow": {
            "enabled": true,
            "showVoiceChannelSectionHeader": true,
            "showInUserProfileModal": true,
            "showInMemberList": true,
            "showInMessages": true
        },
        "USRBG": {
            "enabled": false
        },
        "ValidUser": {
            "enabled": false
        },
        "VoiceChatDoubleClick": {
            "enabled": false
        },
        "VcNarrator": {
            "enabled": false
        },
        "ViewIcons": {
            "enabled": true
        },
        "ViewRaw": {
            "enabled": false
        },
        "VoiceMessages": {
            "enabled": true
        },
        "VolumeBooster": {
            "enabled": true,
            "multiplier": 2
        },
        "WhoReacted": {
            "enabled": false
        },
        "Wikisearch": {
            "enabled": true
        },
        "XSOverlay": {
            "enabled": false
        },
        "DisableCallIdle": {
            "enabled": true
        },
        "EquicordToolbox": {
            "enabled": false
        },
        "FullSearchContext": {
            "enabled": false
        },
        "IloveSpam": {
            "enabled": true
        },
        "NewGuildSettings": {
            "enabled": false
        },
        "Oneko": {
            "enabled": false
        },
        "PartyMode": {
            "enabled": false
        },
        "ServerInfo": {
            "enabled": true
        },
        "ShowHiddenThings": {
            "enabled": true,
            "showTimeouts": true,
            "showInvitesPaused": true,
            "showModView": true,
            "disableDiscoveryFilters": true,
            "disableDisallowedDiscoveryFilters": true
        },
        "UserMessagesPronouns": {
            "enabled": false
        },
        "ChatInputButtonAPI": {
            "enabled": true
        },
        "DynamicImageModalAPI": {
            "enabled": true
        },
        "MessageUpdaterAPI": {
            "enabled": true
        },
        "UserSettingsAPI": {
            "enabled": true
        },
        "AccountPanelServerProfile": {
            "enabled": false
        },
        "AlwaysExpandRoles": {
            "enabled": false
        },
        "AppleMusicRichPresence": {
            "enabled": false
        },
        "WebRichPresence (arRPC)": {
            "enabled": false
        },
        "BetterRoleContext": {
            "enabled": false
        },
        "BetterSessions": {
            "enabled": false
        },
        "BetterSettings": {
            "enabled": false
        },
        "ConsoleJanitor": {
            "enabled": false
        },
        "CopyEmojiMarkdown": {
            "enabled": false
        },
        "CopyFileContents": {
            "enabled": false
        },
        "CtrlEnterSend": {
            "enabled": false
        },
        "CustomIdle": {
            "enabled": false
        },
        "DevCompanion": {
            "enabled": false
        },
        "DontRoundMyTimestamps": {
            "enabled": false
        },
        "FixImagesQuality": {
            "enabled": false
        },
        "FriendsSince": {
            "enabled": false
        },
        "ILoveSpam": {
            "enabled": false
        },
        "ImageLink": {
            "enabled": false
        },
        "ImplicitRelationships": {
            "enabled": false
        },
        "MentionAvatars": {
            "enabled": false
        },
        "MessageLatency": {
            "enabled": false
        },
        "NoMaskedUrlPaste": {
            "enabled": false
        },
        "NoOnboardingDelay": {
            "enabled": false
        },
        "NoServerEmojis": {
            "enabled": false
        },
        "OverrideForumDefaults": {
            "enabled": false
        },
        "PauseInvitesForever": {
            "enabled": false
        },
        "ReplaceGoogleSearch": {
            "enabled": false
        },
        "ReplyTimestamp": {
            "enabled": false
        },
        "Summaries": {
            "enabled": false
        },
        "ShowTimeoutDuration": {
            "enabled": false
        },
        "StickerPaste": {
            "enabled": false
        },
        "StreamerModeOn": {
            "enabled": false
        },
        "UnlockedAvatarZoom": {
            "enabled": false
        },
        "ValidReply": {
            "enabled": false
        },
        "VoiceDownload": {
            "enabled": false
        },
        "WebKeybinds": {
            "enabled": true
        },
        "WebScreenShareFixes": {
            "enabled": true
        },
        "YoutubeAdblock": {
            "enabled": false
        },
        "ViewRawVariant": {
            "enabled": false
        },
        "AllCallTimers": {
            "enabled": false
        },
        "AltKrispSwitch": {
            "enabled": false
        },
        "AmITyping": {
            "enabled": false
        },
        "Anammox": {
            "enabled": false
        },
        "AtSomeone": {
            "enabled": false
        },
        "BannersEverywhere": {
            "enabled": false
        },
        "DecodeBase64": {
            "enabled": false
        },
        "BetterActivities": {
            "enabled": false
        },
        "BetterAudioPlayer": {
            "enabled": false
        },
        "BetterBanReasons": {
            "enabled": false
        },
        "BetterInvites": {
            "enabled": false
        },
        "BetterQuickReact": {
            "enabled": false
        },
        "BetterUserArea": {
            "enabled": false
        },
        "BlockKeywords": {
            "enabled": false
        },
        "BlockKrisp": {
            "enabled": false
        },
        "BypassStatus": {
            "enabled": false
        },
        "ChannelBadges": {
            "enabled": false
        },
        "ChannelTabs": {
            "enabled": false
        },
        "CharacterCounter": {
            "enabled": false
        },
        "CleanChannelName": {
            "enabled": false
        },
        "ClientSideBlock": {
            "enabled": false
        },
        "CommandPalette": {
            "enabled": false
        },
        "CopyUserMention": {
            "enabled": false
        },
        "CustomSounds": {
            "enabled": false
        },
        "CustomTimestamps": {
            "enabled": false
        },
        "CuteAnimeBoys": {
            "enabled": false
        },
        "CuteNekos": {
            "enabled": false
        },
        "CutePats": {
            "enabled": false
        },
        "DeadMembers": {
            "enabled": false
        },
        "Demonstration": {
            "enabled": false
        },
        "DisableCameras": {
            "enabled": false
        },
        "DoNotLeak": {
            "enabled": false
        },
        "DontFilterMe": {
            "enabled": false
        },
        "DoubleCounterBypass": {
            "enabled": false
        },
        "EmojiDumper": {
            "enabled": false
        },
        "Encryptcord": {
            "enabled": false
        },
        "EquicordCSS": {
            "enabled": false
        },
        "ExportContacts": {
            "enabled": false
        },
        "FakeProfileThemesAndEffects": {
            "enabled": false
        },
        "FindReply": {
            "enabled": false
        },
        "FixFileExtensions": {
            "enabled": false
        },
        "FrequentQuickSwitcher": {
            "enabled": false
        },
        "FriendTags": {
            "enabled": false
        },
        "FriendshipRanks": {
            "enabled": false
        },
        "FullUserInChatbox": {
            "enabled": false
        },
        "GensokyoRadioRPC": {
            "enabled": false
        },
        "GifCollections": {
            "enabled": false
        },
        "GifRoulette": {
            "enabled": false
        },
        "Glide": {
            "enabled": false
        },
        "GlobalBadges": {
            "enabled": false
        },
        "GodMode": {
            "enabled": false
        },
        "GoodPerson": {
            "enabled": false
        },
        "GoogleThat": {
            "enabled": false
        },
        "GrammarFix": {
            "enabled": false
        },
        "HideChatButtons": {
            "enabled": false
        },
        "HideMessage": {
            "enabled": false
        },
        "HideServers": {
            "enabled": false
        },
        "HolyNotes": {
            "enabled": false
        },
        "HomeTyping": {
            "enabled": false
        },
        "HopOn": {
            "enabled": false
        },
        "Husk": {
            "enabled": false
        },
        "IRememberYou": {
            "enabled": false
        },
        "Identity": {
            "enabled": false
        },
        "IgnoreTerms": {
            "enabled": false
        },
        "ImagePreview": {
            "enabled": false
        },
        "InRole": {
            "enabled": false
        },
        "IrcColors": {
            "enabled": false
        },
        "JumpToStart": {
            "enabled": false
        },
        "Jumpscare": {
            "enabled": false
        },
        "KeyboardSounds": {
            "enabled": false
        },
        "KeywordNotify": {
            "enabled": false
        },
        "LimitMiddleClickPaste": {
            "enabled": false
        },
        "LoginWithQR": {
            "enabled": false
        },
        "MediaDownloader": {
            "enabled": false
        },
        "MediaPlaybackSpeed": {
            "enabled": false
        },
        "Meow": {
            "enabled": false
        },
        "MessageColors": {
            "enabled": false
        },
        "MessageLinkTooltip": {
            "enabled": false
        },
        "MessageLoggerEnhanced": {
            "enabled": false
        },
        "MessagePeek": {
            "enabled": false
        },
        "MessageTranslate": {
            "enabled": false
        },
        "ModalFade": {
            "enabled": false
        },
        "MoreStickers": {
            "enabled": false
        },
        "MoreThemes": {
            "enabled": false
        },
        "NewPluginsManager": {
            "enabled": false
        },
        "NoAppsAllowed": {
            "enabled": false
        },
        "NoBulletPoints": {
            "enabled": false
        },
        "NoDeleteSafety": {
            "enabled": false
        },
        "NoMirroredCamera": {
            "enabled": false
        },
        "NoModalAnimation": {
            "enabled": false
        },
        "NoNitroUpsell": {
            "enabled": false
        },
        "NoRoleHeaders": {
            "enabled": false
        },
        "NotificationTitle": {
            "enabled": false
        },
        "PinIcon": {
            "enabled": false
        },
        "PlatformSpoofer": {
            "enabled": false
        },
        "PolishWording": {
            "enabled": false
        },
        "PurgeMessages": {
            "enabled": false
        },
        "QuestionMarkReplacement": {
            "enabled": false
        },
        "Quoter": {
            "enabled": false
        },
        "RemixMe": {
            "enabled": false
        },
        "RepeatMessage": {
            "enabled": false
        },
        "ReplaceActivityTypes": {
            "enabled": false
        },
        "ReplyPingControl": {
            "enabled": false
        },
        "RPCStats": {
            "enabled": false
        },
        "ScreenRecorder": {
            "enabled": false
        },
        "SearchFix": {
            "enabled": false
        },
        "SekaiStickers": {
            "enabled": false
        },
        "ServerSearch": {
            "enabled": false
        },
        "ShowBadgesInChat": {
            "enabled": false
        },
        "SidebarChat": {
            "enabled": false
        },
        "Signature": {
            "enabled": false
        },
        "Slap": {
            "enabled": false
        },
        "SoundBoardLogger": {
            "enabled": false
        },
        "StatusPresets": {
            "enabled": false
        },
        "StatusWhilePlaying": {
            "enabled": false
        },
        "SteamStatusSync": {
            "enabled": false
        },
        "StickerBlocker": {
            "enabled": false
        },
        "TalkInReverse": {
            "enabled": false
        },
        "TeX": {
            "enabled": false
        },
        "TextToSpeech": {
            "enabled": false
        },
        "ThemeLibrary": {
            "enabled": false
        },
        "Timezones": {
            "enabled": false
        },
        "Title": {
            "enabled": false
        },
        "TosuRPC": {
            "enabled": false
        },
        "Translate+": {
            "enabled": false
        },
        "UnitConverter": {
            "enabled": false
        },
        "UnlimitedAccounts": {
            "enabled": false
        },
        "UnreadCountBadge": {
            "enabled": false
        },
        "UserPFP": {
            "enabled": false
        },
        "UwUifier": {
            "enabled": false
        },
        "VCSupport": {
            "enabled": true
        },
        "VencordRPC": {
            "enabled": false
        },
        "VideoSpeed": {
            "enabled": false
        },
        "VoiceChannelLog": {
            "enabled": false
        },
        "VoiceChatUtilities": {
            "enabled": false
        },
        "WebpackTarball": {
            "enabled": false
        },
        "WhitelistedEmojis": {
            "enabled": false
        },
        "WhosWatching": {
            "enabled": false
        },
        "WigglyText": {
            "enabled": false
        },
        "Woof": {
            "enabled": false
        },
        "WriteUpperCase": {
            "enabled": false
        },
        "YoutubeDescription": {
            "enabled": false
        },
        "WebContextMenus": {
            "enabled": true,
            "addBack": true
        }
    },
    "notifications": {
        "timeout": 5000,
        "position": "bottom-right",
        "useNative": "not-focused",
        "logLimit": 50
    },
    "cloud": {
        "authenticated": false,
        "url": "https://api.vencord.dev/",
        "settingsSync": false,
        "settingsSyncVersion": 1732480805600
    },
    "enabledThemeLinks": [],
    "ignoreResetWarning": false,
    "userCssVars": {}
}
'';

}
