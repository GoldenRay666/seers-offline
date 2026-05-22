.class public Le22/c55/s88/VManager;
.super Ljava/lang/Object;


# static fields
.field private static mainChildActivity:Ljava/lang/Class;

.field private static mainChildReceiver:Ljava/lang/Class;

.field private static mainChildService:Ljava/lang/Class;

.field private static manager:Le22/c55/s88/VManager;

.field static vId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Le22/c55/s88/VManager;->vId:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Le22/c55/s88/Vaa;

    invoke-static {p1, v0}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildActivity:Ljava/lang/Class;

    sget-object v0, Le22/c55/s88/VManager;->mainChildActivity:Ljava/lang/Class;

    if-nez v0, :cond_0

    :cond_0
    const-class v0, Le22/c55/s88/Vrr;

    invoke-static {p1, v0}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildReceiver:Ljava/lang/Class;

    sget-object v0, Le22/c55/s88/VManager;->mainChildReceiver:Ljava/lang/Class;

    if-nez v0, :cond_1

    :cond_1
    const-class v0, Le22/c55/s88/Vss;

    invoke-static {p1, v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    sget-object v0, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    if-nez v0, :cond_2

    :cond_2
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Le22/c55/s88/VManager;
    .locals 1

    sget-object v0, Le22/c55/s88/VManager;->manager:Le22/c55/s88/VManager;

    if-nez v0, :cond_0

    new-instance v0, Le22/c55/s88/VManager;

    invoke-direct {v0, p0}, Le22/c55/s88/VManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Le22/c55/s88/VManager;->manager:Le22/c55/s88/VManager;

    :cond_0
    sget-object v0, Le22/c55/s88/VManager;->manager:Le22/c55/s88/VManager;

    return-object v0
.end method

.method public static getMainChildActivity(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Le22/c55/s88/VManager;->mainChildActivity:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Le22/c55/s88/Vaa;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildActivity:Ljava/lang/Class;

    :cond_0
    sget-object v0, Le22/c55/s88/VManager;->mainChildActivity:Ljava/lang/Class;

    return-object v0
.end method

.method public static getMainChildReceivre(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Le22/c55/s88/VManager;->mainChildReceiver:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Le22/c55/s88/Vrr;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildReceiver:Ljava/lang/Class;

    :cond_0
    sget-object v0, Le22/c55/s88/VManager;->mainChildReceiver:Ljava/lang/Class;

    return-object v0
.end method

.method public static getMainChildService(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Le22/c55/s88/Vss;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    :cond_0
    sget-object v0, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public getMessage(Landroid/content/Context;Z)V
    .locals 1

    invoke-static {p1}, Le22/c55/s88/f/a;->q(Landroid/content/Context;)V

    invoke-static {p1}, Le22/c55/s88/f/a;->m(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Le22/c55/s88/f/a;->l(Landroid/content/Context;)Z

    invoke-static {}, Le22/c55/s88/f/a;->f()Z

    :cond_0
    invoke-static {p1}, Le22/c55/s88/f/a;->t(Landroid/content/Context;)V

    if-eqz p2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {p1, v0}, Le22/c55/s88/Vss;->a(Landroid/content/Context;I)V

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChlId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Le22/c55/s88/f/a;->k(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public setVId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Le22/c55/s88/f/a;->g(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public stopGetMessage(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Le22/c55/s88/VManager;->mainChildService:Ljava/lang/Class;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    return-void
.end method
