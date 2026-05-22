.class public Lcom/taomee/seer2/a/d;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/taomee/seer2/a/d;


# instance fields
.field private b:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/taomee/seer2/a/d;->b:Landroid/content/Context;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/taomee/seer2/a/d;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/a/d;->a:Lcom/taomee/seer2/a/d;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/a/d;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/a/d;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/taomee/seer2/a/d;->a:Lcom/taomee/seer2/a/d;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/a/d;->a:Lcom/taomee/seer2/a/d;

    iput-object p0, v0, Lcom/taomee/seer2/a/d;->b:Landroid/content/Context;

    sget-object v0, Lcom/taomee/seer2/a/d;->a:Lcom/taomee/seer2/a/d;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->A:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/taomee/seer2/a/d;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/a;->a(Landroid/content/Context;)Lcom/taomee/seer2/a/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/a;->a(Landroid/os/Bundle;)V

    return-void
.end method
