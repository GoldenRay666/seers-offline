.class public final Lcom/tendcloud/tenddata/game/r;
.super Ljava/lang/Object;


# static fields
.field static final a:J = 0x0L

.field static final b:J = 0x0L

.field static final c:J = 0x364L

.field private static d:Landroid/content/SharedPreferences; = null

.field private static final e:Ljava/lang/String; = "pref_file"

.field private static final f:Ljava/lang/String; = "TDGApref.session.start.key"

.field private static final g:Ljava/lang/String; = "TDGApref.session.startsystem.key"

.field private static final h:Ljava/lang/String; = "TDGApref.session.end.key"

.field private static final i:Ljava/lang/String; = "TDGApref.activesessionid.key"

.field private static final j:Ljava/lang/String; = "TDGApref.missionid.key"

.field private static final k:Ljava/lang/String; = "pref.applisttime.key"

.field private static final l:Ljava/lang/String; = "pref.accountid.key"

.field private static final m:Ljava/lang/String; = "pref.accountgame.key"

.field private static final n:Ljava/lang/String; = "pref.init.key"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J
    .locals 2

    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static a()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "pref.accountid.key"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "pref.accountgame.key"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(J)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "pref.applisttime.key"

    invoke-static {v0, v1, p0, p1}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    return-void
.end method

.method public static final a(Landroid/content/Context;)V
    .locals 2

    const-string v0, "pref_file"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->h()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->c()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    return-void
.end method

.method public static a(Landroid/content/Context;J)V
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pref.init.key"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/tendcloud/tenddata/TalkingDataGA;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1, p2}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "pref.accountgame.key"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static b()J
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "pref.applisttime.key"

    const-wide/16 v2, 0x364

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static b(Landroid/content/Context;)J
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pref.init.key"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/tendcloud/tenddata/TalkingDataGA;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method static b(J)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.start.key"

    invoke-static {v0, v1, p0, p1}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    return-void
.end method

.method private static b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V
    .locals 1

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private static b(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static b(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "pref.accountid.key"

    invoke-static {v0, v1, p0}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static c()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.missionid.key"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static c(J)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.end.key"

    invoke-static {v0, v1, p0, p1}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.missionid.key"

    invoke-static {v0, v1, p0}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static d()J
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.start.key"

    const-wide/16 v2, 0x364

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method static d(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.activesessionid.key"

    invoke-static {v0, v1, p0}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static e()J
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.startsystem.key"

    const-wide/16 v2, 0x364

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method static f()V
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.startsystem.key"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    return-void
.end method

.method static g()J
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.session.end.key"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method static h()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/game/r;->d:Landroid/content/SharedPreferences;

    const-string v1, "TDGApref.activesessionid.key"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static i()V
    .locals 1

    const-string v0, ""

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->d(Ljava/lang/String;)V

    return-void
.end method
