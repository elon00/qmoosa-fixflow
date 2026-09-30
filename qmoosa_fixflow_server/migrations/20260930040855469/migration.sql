BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "facility_location" (
    "id" bigserial PRIMARY KEY,
    "workspaceId" bigint NOT NULL,
    "name" text NOT NULL,
    "building" text NOT NULL,
    "floor" text NOT NULL,
    "room" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "issue" (
    "id" bigserial PRIMARY KEY,
    "workspaceId" bigint NOT NULL,
    "reporterId" bigint NOT NULL,
    "reporterName" text NOT NULL,
    "assignedUserId" bigint,
    "assignedUserName" text,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "locationId" bigint NOT NULL,
    "locationName" text NOT NULL,
    "priority" text NOT NULL,
    "status" text NOT NULL,
    "beforePhotoUrl" text,
    "afterPhotoUrl" text,
    "resolutionNote" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "resolvedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "issue_attachment" (
    "id" bigserial PRIMARY KEY,
    "issueId" bigint NOT NULL,
    "uploadedBy" bigint NOT NULL,
    "fileUrl" text NOT NULL,
    "attachmentType" text NOT NULL,
    "fileName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "issue_event" (
    "id" bigserial PRIMARY KEY,
    "issueId" bigint NOT NULL,
    "actorId" bigint NOT NULL,
    "actorName" text NOT NULL,
    "eventType" text NOT NULL,
    "fromStatus" text,
    "toStatus" text,
    "message" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profile" (
    "id" bigserial PRIMARY KEY,
    "authUserId" bigint,
    "displayName" text NOT NULL,
    "email" text NOT NULL,
    "role" text NOT NULL,
    "workspaceId" bigint NOT NULL,
    "avatarUrl" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "workspace" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR qmoosa_fixflow
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('qmoosa_fixflow', '20260930040855469', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930040855469', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
