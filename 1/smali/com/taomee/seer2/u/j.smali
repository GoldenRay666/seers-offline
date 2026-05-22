.class public Lcom/taomee/seer2/u/j;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/taomee/seer2/u/j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/u/j;->a:Lcom/taomee/seer2/u/j;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Lcom/taomee/seer2/u/j;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/u/j;->a:Lcom/taomee/seer2/u/j;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/u/j;

    invoke-direct {v0}, Lcom/taomee/seer2/u/j;-><init>()V

    sput-object v0, Lcom/taomee/seer2/u/j;->a:Lcom/taomee/seer2/u/j;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/u/j;->a:Lcom/taomee/seer2/u/j;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;Z)V
    .locals 0

    invoke-static {p1, p2}, Lcom/taomee/seer2/u/e/i;->b(Landroid/content/Context;Z)V

    return-void
.end method
